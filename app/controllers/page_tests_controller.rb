class PageTestsController < ApplicationController
  def show
    @s = PageTest.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => {:status => view_context.determine_phase(PageTest.find(params[:id])),:count => 1}.to_json}
    end
  end
end
