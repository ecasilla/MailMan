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
    self.body = self.body.gsub("{{first_name}}", recipient.first_name)
    self.body = self.body.gsub("{{last_name}}",  recipient.last_name)
    self.body = self.body.gsub("{{email}}",      recipient.email)
    binding.pry
    self.body.gsub("{{  phone  }}",      recipient.phone)
  end  
end

