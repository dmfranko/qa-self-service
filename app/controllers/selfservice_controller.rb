class SelfserviceController < ApplicationController  
  private
  def skip_login? 
    false 
  end 
end
