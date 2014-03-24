Qaselfservice::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
  address:              'mail.yale.edu',
  port:                 587,
  enable_starttls_auto: true  }
end