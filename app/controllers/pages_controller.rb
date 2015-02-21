class PagesController < ApplicationController
  def index
    @s = Page.where({netid: session[:cas_user]}).order(created_at: :desc).includes(:page_tests)
  end

  def show
    @s = Page.find(params[:id]).page_tests.includes(:captured_page_images)
    respond_to do |format|
      format.html
      format.json { render :json => {:status => "Finsihed",:count => 1}.to_json}
    end
  end
  
  def new
    @user = session[:cas_user]
    @platforms = Platform.includes([:test_operating_system,:test_browser]).where(is_available_in_cloud: 1)
  end
  
  def create
    # Probably want to create this somewhere else?
    p = Page.find_or_create_by(url: params["url"],netid: session[:cas_user]).page_tests.new
    p.save

    # Queue up each one of these to take advantage of threading    
    JSON.parse(params["platforms"]).each do |platform|
      ScreenshotWorker.perform_async(params.merge({:id => p.id,:platform => platform}))
    end
    
    respond_to do |format|
      format.html {redirect_to pages_path}
    end
  end
end
