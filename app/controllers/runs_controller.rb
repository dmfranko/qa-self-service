class RunsController < ApplicationController
  def index
    @r = Run.all.order(id: :desc)
  end

  def create
    r = Run.new
    r.description = params[:description]
    r.notes = params[:notes]
    r.status = "Running"
    r.save
    respond_to do |format|
      format.json { render :json => {:status => "This is a new run",:id => r.id}.to_json}
    end
  end

  private

  def skip_login?
    true
  end
end
