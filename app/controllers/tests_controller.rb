class TestsController < ApplicationController
  # I guess this needs to be required?
  require 'resque_scheduler'

  def create
    # Kick off a process for each platform and environment
    JSON.parse(params["platforms"]).each do |platform|
      Resque.enqueue(TestRunner, params.merge(:platform => platform))
    end

    respond_to do |format|
      format.json { render :json => {:status => "This is a new run",:id => r.id}.to_json}
      format.html {redirect_to(test_path(:id => params["id"]))}
    end
  end

  def show
    @tests = Test.where(:application_id => params[:id]).order(created_at: :desc).includes(:test_result_details)
  end

  def new
    @app = Application.find(params[:id])
    @run_tags = Application.find(params[:id]).application_tags
    @environments = Application.find(params[:id]).application_environments
    @emails = Application.find(params[:id]).application_default_emails
    @users = Application.find(params[:id]).users
    @platforms = Platform.includes([:test_operating_system,:test_browser]).where(is_available_in_cloud: 1)
  end

  def queued_test
    respond_to do |format|
      format.json {render :json => {:status => "Queued",:queue_info => "Resque.info"}.to_json}
    end
  end

  def new_test_run
    t = Test.new
    t.application_id = params[:app_id]
    t.test_run_description = params[:description]
    t.test_run_note = params[:notes]
    t.save

    e = t.test_environments.new
    e.application_environment_id = 1
    e.save

    p = e.test_platforms.new

    p.platform_id = Platform
    .includes([:test_operating_system,:test_browser])
    .where("test_browsers.browser_name" => params[:browser],
    "test_browsers.browser_version" => params[:browser_version],
    "test_operating_systems.operating_system_name" => params[:os])
    .first.id

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
    
    # Send the details via email    
    ResultMailer.result_email(t).deliver
    
    respond_to do |format|
      format.json {render :json => {:status => "OK"}.to_json}
    end
  end

  private

  def skip_login?
    true
  end
end
