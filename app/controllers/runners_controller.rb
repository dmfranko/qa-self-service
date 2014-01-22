# I guess this needs to be required?
require 'resque_scheduler'

class RunnersController < ApplicationController
  def new
    # We'll need to know app id, keys, browsers, etc...
    #Resque.enqueue_in(10.minutes, TestRunner,params)
    #Resque.enqueue(TestRunner, params)
    # This works, but the scheduling thing not so much?
    Resque.enqueue_at(Time.now + 60,TestRunner,params)
        
    respond_to do |format|
      format.json { render :json => {:status => "Queued",:queue_info => Resque.info}.to_json}
    end
  end

  def show
    @app = App.find(params[:id])
  end

  def skip_login?
    true
  end
end
