class PlatformsController < ApplicationController
  def index
    Platform.destroy_all
    SauceWhisk::Sauce.platforms.each do |p|
      r = Platform.new
      r.long_name = p["long_name"]
      r.long_version = p["long_version"]
      r.os = p["os"]
      r.save
    end
    
    @platforms = Platform.all
  end
end