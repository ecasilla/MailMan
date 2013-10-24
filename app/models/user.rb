class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :recipients
  has_many :campaigns
  has_secure_password

  def send_welcome_email                                                        
     UserMailer.welcome_email(self).deliver                                     
  end  
end      