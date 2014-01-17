class UsersController < ApplicationController
  def index
    @u = User.all
  end
  
  private

  def skip_login?
    false
  end
end
