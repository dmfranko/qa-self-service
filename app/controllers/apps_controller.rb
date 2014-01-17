class AppsController < ApplicationController
  def index
    @a = App.all
  end
  
  def show
    @app = App.find(params[:id])
  end
  
  private
  def skip_login? 
    false 
  end 
end
