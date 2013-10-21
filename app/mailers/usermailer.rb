class Usermailer < ActionMailer::Base
 
  def welcome_email(user)
    @user = user
    @url  = user_url(@user)
    email_with_name = "#{@user.name} <#{@user.email}>"
    mail(:to => user.email,
         :subject => "Welcome to Mail Man!") do |format|
      format.html
      format.text
    end
  end

end
