class UsersController < ApplicationController
  def index
    @u = User.all
  end
  
  def new
    @u = User.new
  end
  
  def create
    @u = User.new(user_params)
    @u.name = view_context.directory_info("df336")
    @u.save
    redirect_to users_path,notice: "User added."
  end
  
  def edit
    @u = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path,notice: "User deleted."
  end

  def update
    @u = User.find(params[:id])
    if @u.update(user_params)
      # Handle a successful update.
      redirect_to users_path,notice: "User attributes updated."
      else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:netid,:admin)
  end

  def skip_login?
    false
  end
end
