class TestRunner
  @queue = :testrunner_queue
  def self.perform(params)
    puts "TestRunnerRunning"
    puts params.inspect
    
    Dir.chdir("/Users/admin/Documents/Development/trial2")
    `rspec`
    
    # require 'watir-webdriver'
    # b = Watir::Browser.new :chrome
    # b.goto("yale.edu")
#     
    # require 'gmail'
    # g = Gmail.new("yaleqa@gmail.com","qcrm2013")
#     
    # text = b.text
    # g.deliver do
      # to "dan.franko@yale.edu"
      # subject "Having fun in Puerto Rico!"
      # text_part do
        # body @text
      # end
      # html_part do
        # content_type 'text/html; charset=UTF-8'
        # body text
      # end
      # b.close
    # end
  end
end