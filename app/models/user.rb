class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :first_name,:last_name, presence: true
  has_one :api_key
  has_many :recipients
  has_many :campaigns
  has_secure_password
  #has_attached_file :recipients
  # has_attached_file :csv
  # validates_attachment_presence :csv
  # validates_attachment_content_type :csv, :content_type =&gt; ['text/csv','text/comma-separated-values','text/csv','application/csv','application/excel','application/vnd.ms-excel','application/vnd.msexcel','text/anytext','text/plain']


  before_create :create_api_key
  #after_create send_welcome_email

  def send_welcome_email                                                        
     UserMailer.welcome_email(self).deliver                                     
  end  
  
  def create_api_key
    ApiKey.new(user_id: self.id)
  end

end      

