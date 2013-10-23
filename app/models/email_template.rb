class EmailTemplate < ActiveRecord::Base
  has_one :campaign

  def self.text_search(query)
  if query.present?
     search(query)
 else
    scoped
  end
 end
end