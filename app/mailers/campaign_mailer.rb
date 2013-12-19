class CampaignMailer < ActionMailer::Base
  def blast(campaign, recipient)
    @template = campaign.email_template
    @recipient = recipient

    mail(to: @recipient.email, subject: @template.name)
  end

end
