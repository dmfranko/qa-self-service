class ScreenshotWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(params)
    s = PageTest.find(params["id"])
    s.start_time = Time.now
    s.save
    
    platform = params["platform"]
    
    caps = { 
      :browserName => platform["browser"],
      :version => platform["version"],
      :platform => platform["os"],
      :name => "Screenshots for #{params["url"]}",
      "device-orientation" =>  'landscape',
      :tags => ['screenshots']
    }
    
    
    puts "Capabilities #{caps}"
    @b = Watir::Browser.sauce_start(caps)
    @b.goto(params["url"])

    directory = Rails.root.join('app/assets', 'images','screens',Time.now.strftime("%m%d%Y"))
    Dir.mkdir(directory.to_s) if ! Dir.exists?(directory.to_s)
    
    imageName = "#{SecureRandom.urlsafe_base64 + Time.now.to_i.to_s}.png"
    File.open("/#{directory.to_s}/#{imageName}", 'wb') do|f|
      f.write(Base64.decode64(@b.screenshot.base64))
    end
    
    s.captured_page_images.create(image: "#{Time.now.strftime("%m%d%Y")}/#{imageName}",platform_id: platform["id"])
    s.save
    
    @b.close
    s.end_time = Time.now
    s.run_time = s.end_time - s.start_time
    s.save
  end
end