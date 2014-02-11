class RunsController < ApplicationController
  def index
    @r = Run.all.order(id: :desc)
  end

  def create
    r = Run.new
    r.app_id = params[:app_id]
    r.description = params[:description]
    r.notes = params[:notes]
    r.status = "Queued/Running"
    r.browser = params[:browser]
    r.browser_version = params[:browser_version]
    r.os = params[:os]
    r.save
    respond_to do |format|
      format.json { render :json => {:status => "This is a new run",:id => r.id}.to_json}
    end
  end
  
  def update
    r = Run.find(params[:id])
    r.status = "Finished"
    r.duration = params[:duration]
    r.save
    respond_to do |format|
      format.json { render :json => {:status => "Run updated",:id => r.id}.to_json}
    end
  end

  def show
    @r = Run.where(app_id: params[:id]).order(id: :desc)
  end

  private

  def skip_login?
    true
  end
end
