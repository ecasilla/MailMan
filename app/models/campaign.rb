class Campaign < ActiveRecord::Base
  has_one :email_template
  has_and_belongs_to_many :recipients
  belongs_to :user

  def self.text_search(query)
    if query.present?
       search(query)
    else
      scoped
    end
 end 
end