class TestResultDetailsController < ApplicationController
  def show
    #@run = Run.find(params[:id])
    @p = TestPlatform.find(params[:id])
    @tree = TestPlatform.find(params[:id]).test_hierarchies

    
    # Prepopulate
    old_hash = {"Failed" => 0,"Passed" =>0,"Pending" => 0}
    # Push the counts on to the hash
    @counts = old_hash.merge(Result.where(run_id: params[:id]).count(:group=>"status"))
    
    
    respond_to do |format|
      format.html
      format.csv { render csv: @results }
      
      format.pdf do
        render :pdf => "report"
      end
    end
  end
end
