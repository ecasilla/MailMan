class EmailTemplate < ActiveRecord::Base
  belongs_to :campaign
  validates :name, :body, presence: true

  binding.pry
  before_create parse_according_to(instance)

  def instance
    temp = self.find_by(id: self.id)
    return temp.body
  end

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

  # to return a copy of the template parsed to a specific recipient
  def parse_according_to(template)
    unparsed = self.scan(/^|first_name|last_name|email|phone|\s/)
    return subbed_exp(unparsed)
  end  
  #parsed returns the body of the email template where the Regex finds a match 
  #search for the campaigns recipients and for each replace any custom 
  #code match with the actual name or email for that users campaigns recipients
  def subbed_exp(parsed)
    campaign_recipients = self.campaign.recipients
    campaign_recipients.each do |recipient|
      parsed.select{ |s| s.include? "first_name" }.each{ |s| s.replace(recipient.first_name  ) }
      parsed.select{ |s| s.include? "last_name" }.each{ |s| s.replace(recipient.last_name  ) }
      parsed.select{ |s| s.include? "email" }.each{ |s| s.replace(recipient.email  ) }
      parsed.select{ |s| s.include? "phone" }.each{ |s| s.replace(recipient.phone ) }
    end
  end   
end
#:url => campaign_email_template_path(@campaign)
