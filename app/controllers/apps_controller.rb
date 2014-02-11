class AppsController < ApplicationController
  def index
    @a = App.all
  end

  def show
    @app = App.find(params[:id])
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

  private
  
  def app_params
    params.require(:app).permit(:name,:description,:github_url)
  end
  
  def skip_login?
    false
  end
end
