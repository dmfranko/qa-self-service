class TestRunner
  @queue = :testrunner_queue
  def self.perform(params)
    puts "TestRunnerRunning"
    puts params.inspect
    puts params["platform"].inspect
    # Loop through each platform and queue it separately.
    #JSON.parse(params["platforms"]).each do |p|
      rtime = {
        :emails => ['dan.franko@yale.edu','jason.shuff@yale.edu'],
        :environment => params["environments"],
        :platform => params["platform"],
        :notes => params["message"]
      }.to_s
      Dir.chdir("/Users/admin/Documents/Development/trial2")
      
      # Maybe
      #`RUNTIME='#{rtime}' parallel_rspec app/spec/`
      #puts "Doing a bundle install"
      #puts system("bash", "-c", '/bin/bash --login;/Users/admin/.rvm/bin/rvm gemset use autotest')
      #puts `bash -c $(/bin/bash --login;/Users/admin/.rvm/bin/rvm 2.0.0 ; ruby -v; /Users/admin/.rvm/bin/rvm gemset use autotest)`
      #puts `bundle install`
      `RUNTIME='#{rtime}' rspec`
    #end
  end
end