ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_charset = "utf-8"

#place your email configuration here

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain,
  :user_name => 'ecasilla01@gmail.com',
  :password => 'rugged21',
  :enable_starttls_auto => true,
}