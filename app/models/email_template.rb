class EmailTemplate < ActiveRecord::Base
  belongs_to :campaign
  validates :name, :body, presence: true

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

  # to return a copy of the template parsed to a specific recipient
  def parse_according_to(recipient)
    self.gsub(/<%=([\s\S]+?)%>/, "!!!!" ) + "  (((#{recipient.first_name}555 "
  end
end