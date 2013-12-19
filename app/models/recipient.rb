class Recipient < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :first_name,:last_name, presence: true
  has_many :campaigns
  belongs_to :user
  
 def self.text_search(query)
  if query.present?
     search(query)
 else
    scoped
  end
 end

end