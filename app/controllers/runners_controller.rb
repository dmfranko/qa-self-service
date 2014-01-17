class RunnersController < ApplicationController
  def new
    # We'll need to know app id, keys, browsers, etc...
    Resque.enqueue(TestRunner, params)
    render :text => "Queue Info #{Resque.info}"
  end
  
  def skip_login?
    true
  end
end
