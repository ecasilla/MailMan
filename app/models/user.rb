class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :first_name,:last_name, presence: true
  has_many :recipients
  has_many :campaigns
  has_secure_password
  has_attached_file :recipients

  def send_welcome_email                                                        
     UserMailer.welcome_email(self).deliver                                     
  end  
end      