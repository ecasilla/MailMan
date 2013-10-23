class Campaign < ActiveRecord::Base
  has_one :email_template
  has_many :recipients

  def self.text_search(query)
    if query.present?
       search(query)
    else
      scoped
    end
 end 

  def to_param
    "#{id} #{name}".parameterize
  end
end