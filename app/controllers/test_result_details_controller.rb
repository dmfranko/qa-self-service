class TestResultDetailsController < ApplicationController
  def show
    @p = TestPlatform.find(params[:id])
    @tree = TestPlatform.find(params[:id]).test_hierarchies
    
    respond_to do |format|
      format.html
      format.csv { render csv: @results }
      
      format.pdf do
        render :pdf => "report"
      end
    end
  end
end
