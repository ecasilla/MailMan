class EmailTemplatesController < ApplicationController
  before_action :set_campaign
  before_action :set_email_template 
  
  def index
    @recipient = Recipient.all
    @campaign = Campaign.all
  end

  def new
    @email_template = EmailTemplate.new
  end

  def create
    @email_template = EmailTemplate.new(template_params)
    @email_template.campaign = @campaign

    if @email_template.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @email_template.update(template_params)
      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
  end
end

 private

   def set_email_template
     @email_template = @campaign.email_template
   end

  def template_params
    params.require(:email_template).permit(:name,:body)
  end

  def set_campaign 
    @campaign = Campaign.find_by(id: params[:campaign_id])
  end