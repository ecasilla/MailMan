class EmailTemplate < ActiveRecord::Base
  belongs_to :campaign

  def self.text_search(query)
  if query.present?
     search(query)
 else
    scoped
  end
 end
end