class ResultMailer < ActionMailer::Base
  default from: "yaleqa-noreply@yale.edu"
  
  def result_email(test_details)
    @details = test_details
    mail(to: ["dan.franko@yale.edu","yaleqa@gmail.com"], subject: "Test is complete for #{@details.test_environment.test.application.name}.")
  end
end
