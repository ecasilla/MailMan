class Campaign < ActiveRecord::Base
  has_one :template
  has_many :recipients

  def self.text_search(query)
  if query.present?
     search(query)
 else
    scoped
  end
 end  
end