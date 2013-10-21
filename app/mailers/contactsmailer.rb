class Contactsmailer < ActionMailer::Base
    include Resque::Mailer
end
