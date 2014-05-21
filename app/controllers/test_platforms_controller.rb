class TestPlatformsController < ApplicationController
  def show
    @platforms = TestPlatform.where(:test_environment_id => params[:id])
  end
end