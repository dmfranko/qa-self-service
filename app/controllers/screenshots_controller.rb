class ScreenshotsController < ApplicationController
  def index
    @s = Screenshot.where({netid: session[:cas_user]}).order(created_at: :desc)
  end

  def show
    @s = Screenshot.find(params[:id])
    @screens = Screenshot.find(params[:id]).captured_screen_images
    respond_to do |format|
      format.html
      format.json { render :json => {:status => @s.execution_state,:count => @screens.count}.to_json}
    end
  end
  
  def new
    @user = session[:cas_user]
    @platforms = Platform.includes([:test_operating_system,:test_browser]).where(is_available_in_cloud: 1)
  end
  
  def create
    # Probably want to create this somewhere else?
    s = Screenshot.new(url: params["url"],netid: session[:cas_user],execution_state: 'Queued')
    s.save
    Resque.enqueue(ScreenshotRunner,params.merge({:id => s.id}))
    
    respond_to do |format|
      format.json {render :json => {:status => "Queued",:queue_info => Resque.info}.to_json}
      format.html {redirect_to screenshots_path}
    end
  end
end
