class CampaignsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :show]
  before_action :set_campaign, only: [:show, :edit]

  def index
    @campaigns = @user.campaigns
  end

  def new
    @campaign = Campaign.new
    @email_template = EmailTemplate.all
    @recipients = Recipient.all
  end

  def create
    @campaign = @user.campaigns.create(campaigns_params)
    redirect_to campaign_path(@campaign)
  end

  def show
  end

  def edit
  end

  def update
    if @campaign.update_attributes(campaign_params)
      binding.pry
      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
  end

  private

  def campaigns_params
    params.require(:campaign).permit(:name,:id)
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_campaign
    @campaign = Campaign.find_by(id: params[:id])
  end
end