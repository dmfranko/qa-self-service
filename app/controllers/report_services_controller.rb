class ReportServicesController < ApplicationController
  def addGroup
    respond_to do |format|
      format.json { render :json => {:status => "This is a new group"}.to_json}
    end
  end

  def addResult
    r = Result.new
    r.app_id = 12
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
    newName = "#{SecureRandom.urlsafe_base64 + Time.now.to_i.to_s}.png"
    if params[:screenshot]
      File.open(Rails.root.join('app/assets', 'images', newName), 'wb') do|f|
        f.write(Base64.decode64(params[:screenshot]))
      end
    end
    
    p = Run.find(params[:id])
    run_id = p.id
     
    values = params[:path].split(":")
    
    # There's probably a better way to do this
    # This is the root
    
    @a = Result.find_or_create_by(description: values.first,run_id: run_id)
    #@a.save
    # These are the children/headers
    values[1..-2].each do |x|
      @a = @a.children.find_or_create_by(description: x,run_id: run_id)
      #@a.save
    end
    # The last record contains that actual test details
    @a.children.find_or_create_by(
    run_id: run_id,
    description: values.last,
    duration: 100,
    app_id: 12,
    status: params[:status],
    #description: params[:description],
    location: params[:path],
    duration: params[:duration],
    exception: params[:exception],
    exception_details: params[:exception_details],
    screenshot: newName
    )
    
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
