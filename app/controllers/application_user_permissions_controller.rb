class ApplicationUserPermissionsController < ApplicationController
  def index
    @permissions = ApplicationUserPermission.all
  end

  def new
    @permission = ApplicationUserPermission.new
  end
  
  def create
    @permission = ApplicationUserPermission.new(application_user_permission_params)
    @permission.save
    redirect_to application_user_permissions_path,notice: "Permission added."
  end

  def destroy
    ApplicationUserPermission.find(params[:id]).destroy
    redirect_to application_user_permissions_path,notice: "Permission removed."
  end

  private
  
  def application_user_permission_params
    params.permit(:user_id,:application_id)
  end
  
  def skip_login?
    false
  end
end
