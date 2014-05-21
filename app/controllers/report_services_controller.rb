class ReportServicesController < ApplicationController
  def addGroup
    respond_to do |format|
      format.json { render :json => {:status => "This is a new group"}.to_json}
    end
  end

  def addResult
    r = Result.new
    r.app_id = 3
    r.test_id = 2
    r.status = params[:status]
    r.description = params[:description]
    r.location = params[:path]
    r.duration = params[:duration]
    r.exception = params[:exception]
    r.exception_details = params[:exception_details]
    r.save

    respond_to do |format|
      format.json { render :json => {:status => "This is a new result"}.to_json}
    end
  end

  def create
    if params[:status] == "Failed"
      newName = "#{SecureRandom.urlsafe_base64 + Time.now.to_i.to_s}.png"
      if params[:screenshot]
        File.open(Rails.root.join('app/assets', 'images', newName), 'wb') do|f|
          f.write(Base64.decode64(params[:screenshot]))
        end
      end
    else
      newName = "none"
    end
    
    p = Run.find(params[:id])
    run_id = p.id
    values = params[:path].split(":")
    
    t = Test.new
    t.test_run_description = "This is a run"
    t.save
    
    plat = t.test_platform.create(platforms_id: 500)
    @a = plat.test_hierarchies.find_or_create_by(test_hierarchy_description: values.first)
    @a.save
    
    # These are the children/headers
    values[1..-2].each do |x|
      @a.children.create(test_hierarchy_description: x)
      byebug
    end

    @a.test_result_details.create(is_pass: 0)
    @a.save
    
    respond_to do |format|
      format.json { render :json => {:status => "This is a new result"}.to_json}
    end
  end

  private

  def skip_login?
    true
  end
end
