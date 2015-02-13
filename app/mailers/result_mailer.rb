class ResultMailer < ActionMailer::Base
  add_template_helper(TestResultDetailsHelper)
  default from: "yaleqa-noreply@yale.edu"
  
  def result_email(test)
    @t = test
    mail(to: @t.result_emails, subject: "Test is complete for #{@t.application.name}.")
  end
end
