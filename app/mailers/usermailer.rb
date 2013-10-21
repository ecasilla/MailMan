class Usermailer < ActionMailer::Base
  include Resque::Mailer

end
