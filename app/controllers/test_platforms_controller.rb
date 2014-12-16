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
end