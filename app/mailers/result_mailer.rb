class ResultMailer < ActionMailer::Base
  default from: "yaleqa-noreply@yale.edu"
  
  def result_email(test_details)
    @details = test_details
    mail(to: test_details.test_environment.test.result_emails, subject: "Test is complete for #{@details.test_environment.test.application.name}.")
  end
end
