class TestRunner
  @queue = :testrunner_queue
  def self.perform(params)
    puts "TestRunnerRunning"
    puts params.inspect
    puts "ENVS : #{params["environments"]}"
    rtime = {:emails => ['dan.franko@yale.edu','jason.shuff@yale.edu'],
      :environment => params["environments"]}.to_s
    Dir.chdir("/Users/admin/Documents/Development/trial2")
    `RUNTIME='#{rtime}' rspec`
  end
end