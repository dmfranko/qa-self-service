class TestRunner
  @queue = :testrunner_queue
  def self.perform(params)
    puts "TestRunnerRunning"
    puts params.inspect
    
    Dir.chdir("/Users/admin/Documents/Development/trial2")
    `rspec`
  end
end