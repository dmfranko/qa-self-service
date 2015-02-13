class TestMailer < ActionMailer::Base
  default from: "yaleqa-noreply@yale.edu"
  
  def test_email
    #@details = test_details
    mail(to: "dan.franko@yale.edu", subject: "This is a test email")
  end
end
