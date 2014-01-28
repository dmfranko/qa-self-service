class RunDetailsController < ApplicationController
  def show
    @run = Run.find(params[:id])
    @results = Run.find(params[:id]).results
    @tree = Result.where(run_id: params[:id],ancestry: nil)
    
    # Prepopulate
    old_hash = {"Failed" => 0,"Passed" =>0,"Pending" => 0}
    # Push the counts on to the hash
    @counts = old_hash.merge(Result.where(run_id: params[:id]).count(:group=>"status"))
    
    respond_to do |format|
      format.html
      format.csv { render csv: @results }
      format.pdf do
        render :pdf => "file_name",:template => 'layouts/application.html.erb'
      end
    end
  end
  
  private
  def skip_login? 
    false 
  end
end
