class AboutController < ApplicationController
  def summary
    @status = status
    @up = up?
    
    respond_to do |format|
      format.html {render :layout => false}
      format.json { render :json => {:status => "up"}.to_json}
    end
  end

  def detail
    @status = status
    @up = up?
  end

  def status
    if up? then return "Application Tests OK - " + Time.now.inspect
    else return "Application Tests FAILED - " + Time.now.inspect
    end
  end

  def up?
    true
  end
  
  private
  def skip_login? 
    true 
  end
end
