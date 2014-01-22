class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter CASClient::Frameworks::Rails::Filter, :unless => :skip_login? 

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
  
  def skip_login? 
    false 
  end 
end
