class TestRunner
  include Resque::Plugins::Status
  @queue = :testrunner_queue
  
  def perform
    puts "TestRunnerRunning"
    puts options.inspect
    
    require 'uri'
    url = options["github_url"]
    uri = URI.parse(url)
    name = File.basename(uri.path)

    # Checking to see if we're on ec2
    if Dir.exists?("/home/ec2-user/")
      #path = "/home/ec2-user/scripts/"
      path = "/Users/admin/Documents/Development/"

      # If the directory doesn't exists
      if ! Dir.exists?("/home/ec2-user/scripts/#{name}")
        g = Git.clone(options["github_url"], name, :path => path)
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
      :environment => JSON.parse(options["execution_environment"]),
      :platform => options["platform"],
      # resque status overrides Hash for some reason?
      :tags =>  Hash::Hash[options["tag_fields"].map{|(k,v)| [k.to_sym,v.to_i.to_bool]}],
      :filter => options["filter"],
      :test_id => options["test_id"],
      :notes => options["message"]
    }.to_s
    
    # We're on ec2.  This is temporary
    if Dir.exists?("/home/ec2-user/")
      Dir.chdir("/home/ec2-user/scripts/#{name}")
    else
      #Dir.chdir("/Users/admin/Documents/Development/#{name}")
      Dir.chdir("/Users/admin/Documents/Development/DemoProject")
    end
    
    puts "PASSPHRASE='#{options["passphrase"]}' RUNTIME='#{rtime}' rspec"
    `PASSPHRASE='#{options["passphrase"]}' RUNTIME='#{rtime}' rspec --tag {"navigation"=>"1"}`
  end
end