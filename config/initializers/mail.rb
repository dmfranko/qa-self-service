Qaselfservice::Application.configure do
  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  # address:              'smtp.gmail.com',
  # port:                 587,
  # enable_starttls_auto: true  }
  
  config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'example.com',
  user_name:            'yaleqa@gmail.com',
  password:             '<password>',
  authentication:       'plain',
  enable_starttls_auto: true  }
end