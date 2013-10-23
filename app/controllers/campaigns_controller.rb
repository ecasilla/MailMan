class CampaignsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :show]

  def index
    @campaigns = @user.campaigns
    #@recipients = Recipient.all
  end

  def new
    @campaign = Campaign.new
    @email_template = EmailTemplate.all
    @recipients = Recipient.all
  end

  def create
    @campaign = @user.campaigns.create(campaigns_params)
    
    redirect_to user_campaign_path(@user, @campaign)
  end

  def show
    @campaign = Campaign.find_by(id: params[:id].split('-').first)
  end

  def edit
  end

  def delete
  end

  private

  def campaigns_params
    params.require(:campaign).permit(:name,:id)
  end

  def set_user
    @user = User.find_by(id: params[:user_id].split("-").first)
  end

end