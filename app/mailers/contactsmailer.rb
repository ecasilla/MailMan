class Contactsmailer < ActionMailer::Base
   
   def blast (contact)
     default :to => Contact.all.map(&:email),
             :from => "#{@user.email}"
             :body :user =>
   end
   
end
