module Watir
  class Browser
    class << self
      def sauce_start(caps,*args)
        # If we didn't get a platform we're assuming that we're running locally.
        # Don't like how long service status takes now.

        # Need to work args back in.
        if ! caps[:local] # && SauceWhisk::Sauce.service_status[:service_operational]
          b = Watir::Browser.new(:remote,
          :url => "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
          :desired_capabilities => caps)
        else
          puts "Running locally"
          b = Watir::Browser.new(caps[:browserName])
        end
      end
    end
  end # Browser
end # Watir