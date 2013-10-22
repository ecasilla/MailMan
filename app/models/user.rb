class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_secure_password

def to_param
 "#{id} #{name}".parameterize
end

def send_welcome_email                                                        
   UserMailer.welcome_email(self).deliver                                     
end  

end      