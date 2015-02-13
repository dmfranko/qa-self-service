module TestPlatformsHelper
  def test_platform_status(platform)
      Sidekiq::Status::status(platform.resque_key).capitalize
  end
  
  def start_time(platform)
    platform.test_run_platform_start_time.localtime.strftime("%r") if ! platform.test_run_platform_start_time.nil?
  end

  def end_time(platform)
    platform.test_run_platform_end_time.localtime.strftime("%r") if ! platform.test_run_platform_end_time.nil?
  end
  
  def duration(platform)
    if platform.test_run_platform_end_time && platform.test_run_platform_start_time 
      t = (platform.test_run_platform_end_time - platform.test_run_platform_start_time).round(2)
      Time.at(t).utc.strftime("%H:%M:%S")
    end
  end
end
