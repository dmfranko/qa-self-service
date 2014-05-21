# I guess this needs to be required?
require 'resque_scheduler'

class RunnersController < ApplicationController
  def create
    # Kick off a process for each platform
    JSON.parse(params["platforms"]).each do |p|
      Resque.enqueue(TestRunner, params.merge(:platform => p))
    end
    
    # We'll need to know app id, keys, browsers, etc...
    #Resque.enqueue_in(10.minutes, TestRunner,params)
    # This works, but the scheduling thing not so much?
    #Resque.enqueue_at(Time.now + 60,TestRunner,params)
        
    respond_to do |format|
      format.json {render :json => {:status => "Queued",:queue_info => Resque.info}.to_json}
      format.html {redirect_to(run_path(:id => params["id"]))}
    end
  end

  def show
    # @app = Application.find(params[:id])
# 
    # @tags = Application.find(params[:id]).application_tags
    # @target_environments = Application.find(params[:id]).application_environments
    # @emails = Application.find(params[:id]).application_default_emails    


    @app = Application.find(params[:id])
    
    @run_tags = Application.find(params[:id]).application_tags
    @environments = Application.find(params[:id]).application_environments
    @emails = Application.find(params[:id]).application_default_emails
    @users = Application.find(params[:id]).users

    @platforms = Platform.includes([:test_operating_system,:test_browser]).where(is_available_in_cloud: 1)
  end

  def skip_login?
    true
  end
end
