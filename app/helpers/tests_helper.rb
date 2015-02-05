module TestsHelper
  def tests_running(t)
    if t.test_platforms.where(:test_run_platform_end_time => nil).count > 0
      "Incomplete"
    else
      "Completed"
    end
  end
end
