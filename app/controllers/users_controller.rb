class UsersController < ApplicationController
  def index
    @u = User.all
    Resque.enqueue(TestRunner, params)
    render :text => "Queue Info #{Resque.info}"
  end
  
  private

  def skip_login?
    false
  end
end
