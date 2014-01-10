class CampaignBlaster

  @queue = :recipients_blast 

  def self.perform(campaign_id,recipient_id)
    # Code in here is what happens when this executed by the worker
    campaign = Campaign.find(campaign_id)
    recipient = Recipient.find(recipient_id)
    CampaignMailer.blast(campaign, recipient).deliver
  end
end

#To Send Email I Need A Recipient A Template And A Campaign