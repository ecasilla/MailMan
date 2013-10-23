class CampaignsController < ApplicationController
  
  def index
    @user = User.find_by(id: params[:user_id].split("-").first)
    @campaigns = @user.campaigns
    #@recipients = Recipient.all
  end

  def new
    @campaign = Campaign.new
    @user = User.find_by(id: params[:user_id].split("-").first)
    @email_template = EmailTemplate.all
    @recipients = Recipient.all
  end

  def create
    @user = User.find_by(id: params[:user_id].split("-").first)
    @campaign = @user.campaigns.create(campaigns_params)
    
    redirect_to user_campaign_path(@user, @campaign)
  end

  def show
    @user = User.find_by(id: params[:user_id].split("-").first)
  end

  def edit
  end

  def delete
  end

  private

  def campaigns_params
    params.require(:campaign).permit(:name,:id)
  end

end