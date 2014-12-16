class ApplicationsController < ApplicationController
  def index
    @a = User.where(netid: "df336").first.applications
  end

  def show
    @app = Application.find(params[:id])
    
    @run_tags = Application.find(params[:id]).application_tags
    @environments = Application.find(params[:id]).application_environments
    @emails = Application.find(params[:id]).application_default_emails
    @users = Application.find(params[:id]).users
  end

  def new
    @app = Application.new
  end
  
  def create
    @app = Application.new(app_params)
    @app.save
    redirect_to applications_path,notice: "Application added."
  end

  def edit
    @app = Application.find(params[:id])
  end

  def update
    @app = Application.find(params[:id])
    if @app.update(app_params)
      # Handle a successful update.
      redirect_to applications_path,notice: "Application attributes updated."
      else
      render 'edit'
    end
  end

  def destroy
    Application.find(params[:id]).destroy
    redirect_to applications_path,notice: "App deleted."
  end


  private
  
  def app_params
    params.require(:application).permit!
  end
  
  def skip_login?
    false
  end
end
