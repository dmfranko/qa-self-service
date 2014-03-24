class ScreenshotRunner
  @queue = :screenshot_queue
  def self.perform(params)
    #s = Screenshot.new(url: params["url"],netid: params["user"],status: 'Running')
    #s.save
    
    s = Screenshot.find(params["id"])
    s.status = "Running"
    s.save
    
    JSON.parse(params["platforms"]).each do |p|
      caps = { 
        :browserName => p["browser"],
        :browser_version => p["version"],
        :os => p["os"],
        :name => "Screenshots for #{params["url"]}",
        :tags => ['screenshots']
      }
      
      @b = Watir::Browser.sauce_start(caps)
      @b.goto(params["url"])

      directory = Rails.root.join('app/assets', 'images','screens',Time.now.strftime("%m%d%Y"))
      Dir.mkdir(directory.to_s) if ! Dir.exists?(directory.to_s)
      
      imageName = "#{SecureRandom.urlsafe_base64 + Time.now.to_i.to_s}.png"
      File.open("/#{directory.to_s}/#{imageName}", 'wb') do|f|
        f.write(Base64.decode64(@b.screenshot.base64))
      end
  
      s.screen_images.create(browser: p["browser"],os: p["os"],version: p["version"],image: "#{Time.now.strftime("%m%d%Y")}/#{imageName}")
      s.save
      
      @b.close
    end
    s.status = 'Finished'
    s.save
  end
end