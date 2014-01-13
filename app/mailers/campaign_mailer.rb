class CampaignMailer < ActionMailer::Base
  default from:"eenterprise001@gmail.com"
  
  def blast(campaign, recipient)
    @template = campaign.email_template
    @recipient = recipient

    mail(to: @recipient.email, subject: @template.name)
  end

end
