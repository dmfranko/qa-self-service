class PlatformsController < ApplicationController
get '/loadPlatforms' do
  protected!
  # Drop everthing in the table
  SaucePlatform.destroy_all

  platforms = SauceWhisk::Sauce.platforms 
  platforms.each do |p|
    r = SaucePlatform.new
    r.name = p["long_name"]
    r.version = p["long_version"]
    r.os = p["os"]
    r.save
  end

  # Display the list back to the users
  @p = SaucePlatform.all
  erb :platforms
end
end
