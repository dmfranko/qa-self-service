class AppsController < ApplicationController
  def index
    @a = User.where(netid: "df336").first.apps
  end

  def show
    
    @tags = App.find(params[:id]).application_tags
    @environments = App.find(params[:id]).application_environments
    @users = App.find(params[:id]).users
    @app = App.find(params[:id])
  end

  def new
    @app = App.new
  end
  
  def create
    @app = App.new(app_params)
    @app.tags = params["app"]["tags"].split(",")
    @app.default_emails = params["app"]["default_emails"].split(",")
    @app.save
    redirect_to apps_path,notice: "App added."
  end

  def edit
    @app = App.find(params[:id])
  end

  def update
    @app = App.find(params[:id])
    if @app.update(app_params)
      # Handle a successful update.
      redirect_to apps_path,notice: "Application attributes updated."
      else
      render 'edit'
    end
  end

  def destroy
    App.find(params[:id]).destroy
    redirect_to apps_path,notice: "App deleted."
  end


  private
  
  def app_params
    #params.require(:app).permit(:name,:description,:github_url,{:envs => {}})
    params.require(:app).permit!
  end
  
  def skip_login?
    false
  end
end
