class ReportsController < ApplicationController
  def index
    @r = Run.all
    @result = Result.all
  end
  
  def show
    @result = Result.find_by test_id: params[:test_id]
  end  

  def new
    respond_to do |format|
      format.json { render :json => {:status => "This is a new job",:id => 2349987}.to_json}
    end
  end
  
  private
  # Need to implement some active_record to use this
  def addResult_params
      params.require(:id).permit(:duration)
  end
  
  def skip_login? 
    true 
  end 
end
