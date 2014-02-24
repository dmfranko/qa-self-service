class ScreenshotsController < ApplicationController
  def index
    @s = Screenshot.where({netid: session[:cas_user]})
  end

  def show
    @s = Screenshot.find(params[:id])
    @screens = Screenshot.find(params[:id]).screen_images
  end
  
  def new
    @user = session[:cas_user]
    @platforms = Platform.all
  end
  
  def create
    Resque.enqueue(ScreenshotRunner,params.merge({:user => session[:cas_user]}))
    
    respond_to do |format|
      format.json {render :json => {:status => "Queued",:queue_info => Resque.info}.to_json}
      format.html {redirect_to screenshots_path}
    end
  end
end
