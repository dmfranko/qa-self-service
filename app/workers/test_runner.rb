class TestRunner
  @queue = :testrunner_queue
  def self.perform(params)
    puts "TestRunnerRunning"
    puts params.inspect
    
    require 'uri'
    url = params["github_url"]
    uri = URI.parse(url)
    name = File.basename(uri.path)

    # Checking to see if we're on ec2
    if Dir.exists?("/home/ec2-user/")
      path = "/home/ec2-user/scripts/"

      # If the directory doesn't exists
      if ! Dir.exists?("/home/ec2-user/scripts/#{name}")
        g = Git.clone(params["github_url"], name, :path => path)
      else
      # Else got to the directory and make sure we've got whatever is current.
        Dir.chdir(path + name)
        # Then reset
        `git reset --hard`
        # Then back to the master branch
        `git pull --rebase origin`
      end
    end

    # Loop through each platform and queue it separately.
    rtime = {
      :emails => ['dan.franko@yale.edu','jason.shuff@yale.edu'],
      :environment => params["environments"],
      :platform => params["platform"],
      :tags =>  Hash[params["run_tags"].map{|(k,v)| [k.to_sym,v.to_i.to_bool]}],
      :filter => params["filter"],
      :notes => params["message"]
    }.to_s
   
    # We're on ec2.  This is temporary
    if Dir.exists?("/home/ec2-user/")
      Dir.chdir("/home/ec2-user/scripts/#{name}")
    else
      Dir.chdir("/Users/admin/Documents/Development/#{name}")
    end
    
    # Maybe
    #`RUNTIME='#{rtime}' parallel_rspec app/spec/`
    #puts "Doing a bundle install"
    #puts system("bash", "-c", '/bin/bash --login;/Users/admin/.rvm/bin/rvm gemset use autotest')
    #puts `bash -c $(/bin/bash --login;/Users/admin/.rvm/bin/rvm 2.0.0 ; ruby -v; /Users/admin/.rvm/bin/rvm gemset use autotest)`
    #puts `bundle install`
    
    `PASSPHRASE='#{params["passphrase"]}' RUNTIME='#{rtime}' rspec`
  end
end