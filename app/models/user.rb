class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_secure_password
extend FriendlyId
  friendly_id :id, use: :slugged

def should_generate_new_friendly_id?
    new_record?
  end
end

def send_welcome_email                                                        
   UserMailer.welcome_email(self).deliver                                     
 end        