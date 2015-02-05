class TestPlatformsController < ApplicationController
  def show
    @platforms = TestPlatform.where(:test_environment_id => params[:id])
  
    respond_to do |format|
      format.html
      format.csv { render csv: @results }
      
      format.pdf do
        render :pdf => "report"
      end
    end
  end
  
  def pending_platform
    platform = TestPlatform.find(params[:test_platform_id])
    
    respond_to do |format|
      format.json {render :json => {:run_status => view_context.test_platform_status(platform)}.to_json}
    end
  end
end