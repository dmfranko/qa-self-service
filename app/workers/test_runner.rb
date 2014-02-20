class TestRunner
  @queue = :testrunner_queue
  def self.perform(params)
    puts "TestRunnerRunning"
    puts params.inspect
    
    # name = "DemoProject"
    # path = "/home/ec2-user/scripts/"
#     
    # # If the directory doesn't exists
    # if ! Dir.exists?("/home/ec2-user/scripts/#{name}")
      # g = Git.clone("https://github.com/dmfranko/DemoProject.git", name, :path => path)
    # else
    # # Else got to the directory and make sure we've got whatever is current.
      # Dir.chdir(path + name)
      # # Then reset
      # `git reset --hard`
      # # Then back to the master branch
      # `git pull --rebase origin`
    # end
    
    
    # Loop through each platform and queue it separately.
    #JSON.parse(params["platforms"]).each do |p|
      rtime = {
        :emails => ['dan.franko@yale.edu','jason.shuff@yale.edu'],
        :environment => params["environments"],
        :platform => params["platform"],
        :tags =>  Hash[params["tags"].map{|(k,v)| [k.to_sym,v.to_i.to_bool]}],
        :filter => params["filter"],
        :notes => params["message"]
      }.to_s
      #Dir.chdir("/home/ec2-user/scripts/#{name}")
      Dir.chdir("/Users/admin/Documents/Development/DemoProject")
      
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