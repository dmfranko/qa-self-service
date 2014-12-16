class TestHierarchyController < ApplicationController
  def show
    @h = TestHierarchy.where(:test_platform_id => params[:id])
  end

  def create
    values = params[:path].split(":")
    @details = TestPlatform.find(params[:id]).test_hierarchies.find_or_create_by(test_hierarchy_description: values.first)

    # These are the children/headers
    values[1..-2].each do |x|
      @details = @details.children.find_or_create_by(test_hierarchy_description: x,:test_platform_id => params[:id])
    end
    #@details.children.find_or_create_by(test_hierarchy_description: values.last,:test_platform_id => params[:id])
    
    # If there's a failure we do some extra stuff
    if params[:status] == "Failed"
      exception = @details
      .children.create(test_hierarchy_description: values.last,:test_platform_id => params[:id])
      .test_result_details.create(:is_pass => 0,:test_execution_duration => params[:duration])
      .test_result_exceptions.new
      
      exception.exception_text = params[:exception]
      exception.exception_debug_details = params[:exception_details]
      
      if params[:screenshot]
        newName = "#{SecureRandom.urlsafe_base64 + Time.now.to_i.to_s}.png"
        File.open(Rails.root.join('app/assets', 'images', newName), 'wb') do|f|
          f.write(Base64.decode64(params[:screenshot]))
        end
        exception.exception_screenshot = newName  
      end
      
      exception.save
     else
      @details.children.create(test_hierarchy_description: values.last,:test_platform_id => params[:id]).test_result_details.create(:is_pass => 1)
    end
    
    # status: params[:status],
    # location: params[:path],
    # duration: params[:duration],
    # exception: params[:exception],
    # exception_details: params[:exception_details],
    # screenshot: newName

    respond_to do |format|
      format.json { render :json => {:status => "This is a new result"}.to_json}
    end
  end
  
  def skip_login?
    true
  end
end
