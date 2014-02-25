class ScreenshotsController < ApplicationController
  def index
    @s = Screenshot.where({netid: session[:cas_user]})
  end

  def show
    @s = Screenshot.find(params[:id])
    @screens = Screenshot.find(params[:id]).screen_images
    respond_to do |format|
      format.html
      format.json { render :json => {:status => @s.status}.to_json}
    end
  end
  
  def new
    @user = session[:cas_user]
    @platforms = Platform.all
  end
  
  def create
    # Probably want to create this somewhere else?
    Resque.enqueue(ScreenshotRunner,params.merge({:user => session[:cas_user]}))
    
    respond_to do |format|
      format.json {render :json => {:status => "Queued",:queue_info => Resque.info}.to_json}
      format.html {redirect_to screenshots_path}
    end
  end
end
