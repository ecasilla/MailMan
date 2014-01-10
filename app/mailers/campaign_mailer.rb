class CampaignMailer < ActionMailer::Base
  default from:"test@mailman.com"
  
  def blast(campaign, recipient)
    @template = campaign.email_template
    @recipient = recipient

    mail(to: @recipient.email, subject: @template.name)
  end

end
