class EmailTemplatesController < ApplicationController
  before_action :set_campaign
  
  def index
    @recipient = Recipient.all
    @campaign = Campaign.all
  end

  def new
    @email_template = EmailTemplate.new
    @user
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

  def show
     @email_template = EmailTemplate.find(email_params[:id])
  end

  def update
    # if @email_template.update_attributes(email_params)
    #   redirect_to user_campaign_path(@user, @campaign)
    # else
    #   render :edit
    # end
  end

  def delete
    # if @email_template.destroy
    #   redirect_to user_campaign_path(@user, @campaign)
    # else
    #   render :edit
    # end
  end

end

 private

  def template_params
    params.require(:email_template).permit(:name,:body)
  end

  def set_campaign 
    @campaign = Campaign.find_by(id: params[:campaign_id])
  end