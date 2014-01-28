class RunsController < ApplicationController
  def index
    @r = Run.all.order(id: :desc)
  end

  def create
    r = Run.new
    r.app_id = params[:app_id]
    r.description = params[:description]
    r.notes = params[:notes]
    r.status = "Running"
    r.save
    respond_to do |format|
      format.json { render :json => {:status => "This is a new run",:id => r.id}.to_json}
    end
  end

  def show
    @r = Run.where(app_id: params[:id])
  end

  private

  def skip_login?
    true
  end
end
