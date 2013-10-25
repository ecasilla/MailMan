class CampaignMailer < ActionMailer::Base
  #include Resque::Mailer

  def send_blast
    
  end
 
  def welcome_email(user)
    @user = user
    @url  = 'nameless-badlands-4713.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Mail Man')
  end
end
