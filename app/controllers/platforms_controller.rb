class PlatformsController < ApplicationController
  def index
    # Set all of them to unavailable for the moment
    TestPlatform.update_all({:is_available_in_cloud => 0})

    # Go out to saucelabs to get the current list of platforms.
    SauceWhisk::Sauce.platforms.each do |p|
      # Add os if it doesn't exist
      os = TestOperatingSystem.find_or_create_by(operating_system_name: p["os"]).id
      
      # Add browser if it doesn't exists
      browser = TestBrowser.find_or_create_by(browser_name: p["api_name"],browser_version: p["short_version"]).id
      
      # Add to this list of platforms and mark as available
      TestPlatform.find_or_create_by(test_browser_id: browser,test_operating_system_id: os).update({:is_available_in_cloud => 1})
    end
    
    @platforms = TestPlatform.all(:include => [:test_operating_system,:test_browser])
    #@platforms = AvailableTestPlatform.all
  end
end