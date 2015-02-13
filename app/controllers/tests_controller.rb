class TestsController < ApplicationController
  # I guess this needs to be required?
  #require 'resque_scheduler'

  def create
    # Create the high level test from the form and pass it down

    t = Test.new
    t.application_id = params[:id]
    
    # Do I need description?
    t.test_run_description = params[:description]
    t.test_run_note = params[:message]
    t.result_emails = params[:user][:address]
    t.save
    
    # Kick off a process for each platform and environment
    
    #each environment
    params["environments"].each do |e|
      application_environment = ApplicationEnvironment.find(e)

      env = t.test_environments.find_or_create_by(application_environment_id: application_environment.id)
      env.save

      JSON.parse(params["platforms"]).each do |platform|
        p = env.test_platforms.new
        p.platform_id = platform["id"]
        p.save
        
        #job_id = TestRunner.create(params.merge(:platform => platform,:test_id => t.id,:execution_environment => application_environment.to_json))
        
        # Now!
        #job_id = TestWorker.perform_async(params.merge(:platform => platform,:test_id => t.id,:execution_environment => application_environment.to_json))
        
        # Schedule it!
        job_id = TestWorker.perform_at(Chronic.parse("#{params["number"]} #{params["time_slice"]} from now"),params.merge(:platform => platform,:test_id => t.id,:execution_environment => application_environment.to_json))

        #MailWorker.perform_async

        # May be able to find scheduled job info this way.
        #Sidekiq.redis { |r| r.zrange("schedule", 0, -1, {withscores: true}) }
        #Time.at(1423703069.194361).utc
        #q = Sidekiq::Job.new("e19d5e877d4e0d68b80c75a3","default")?
        
        p.resque_key = job_id
        p.save        
      end
    end
    
    respond_to do |format|
      format.json { render :json => {:status => "This is a new run",:id => r.id}.to_json}
      format.html {redirect_to(test_path(:id => params["id"]))}
    end
  end

  def show
    if params[:status] != "incomplete"
      @tests = Test.where(:application_id => params[:id])
      .order(created_at: :desc)
      .includes(:test_result_details,:test_platforms)
      .paginate(:per_page => 10, :page => params[:page])
    else
      # Return the details of tests that are incomplete
      @tests = Test.where(:application_id => params[:id])
      .order(created_at: :desc)
      .includes(:test_result_details,:test_platforms)
      .where(test_platforms: { :test_run_platform_end_time => nil })
      
      @records = {}
      @tests.each do |t|
        @records[t.id] = {
          :fail => t.test_result_details.where(:is_pass => 0).count,
          :pass => t.test_result_details.where(:is_pass => 1).count,
          :pending => t.test_result_details.where(:is_pass => nil).count,
          :test_run_note => t.test_run_note,
          :request_time => t.created_at.localtime.strftime("%D %r")
        }
      end
    end
    
    respond_to do |format|
      format.json { render :json => {:incomplete => @tests.to_json}}
      #format.json { render :json => {:incomplete => @records.to_json}}
      format.html
    end
  end

  def new
    @test = Test.new
    @app = Application.includes(:application_tags,
    :application_environments,
    :application_default_emails,
    :users)
    .find(params[:id])
    @platforms = Platform.includes([:test_operating_system,:test_browser]).where(is_available_in_cloud: 1)
  end

  def new_test_run
    t = Test.find(params[:test_id])
    t.application_id = params[:app_id]
    t.test_run_description = params[:description]
    t.save
    
    # Save the environment
    e = t.test_environments.find_or_create_by(application_environment_id: params[:environment_id])
    e.save
    
    # Save the platform
    p = e.test_platforms.find_or_create_by(platform_id: params[:platform_id])
    p.test_run_platform_start_time = Time.now
    p.save

    # Return platform id
    respond_to do |format|
      format.json {render :json => {:id => p.id}.to_json}
    end
  end

  def end_test_run
    t = TestPlatform.find(params[:id])
    t.test_run_platform_end_time = Time.now
    t.save
    
    parent_test = t.test_environment.test
    
    # Are there other tests left to run?  Is there a better way to do this?
    # What if a test fails to run, however unlikely that is.   
    # We only want to send one master report 
    if parent_test.test_platforms.where(test_run_platform_end_time: nil).count == 0
      # Send the details via email    
      ResultMailer.result_email(parent_test).deliver
    end
        
    respond_to do |format|
      format.json {render :json => {:status => "OK"}.to_json}
    end
  end
  
  def pending_test
    test = Test.includes(:test_result_details).find(params[:test_id])
    
    respond_to do |format|
      format.json {render :json => {:run_status => view_context.tests_running(test),
        :total => test.test_result_details.count,
        :pass => test.test_result_details.where(:is_pass => 1).count,
        :fail =>test.test_result_details.where(:is_pass => 0).count,
        :pending => test.test_result_details.where(:is_pass => nil).count}.to_json}
    end
  end

  private

  def skip_login?
    true
  end
end
