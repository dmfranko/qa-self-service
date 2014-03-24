class ResultMailer < ActionMailer::Base
  default from: "yaleqa-noreply@yale.edu"
  
  def result_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: ["dan.franko@yale.edu","yaleqa@gmail.com"], subject: 'Welcome to My Awesome Site')
  end
end
