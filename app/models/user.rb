class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :first_name,:last_name, presence: true
  has_one :api_key
  has_many :recipients
  has_many :campaigns
  has_secure_password
  after_create :create_api_key
  
  def send_welcome_email                                                        
     UserMailer.welcome_email(self).deliver                                     
  end  
  
  def create_api_key
    ApiKey.create(user_id: self.id)
  end

end      

