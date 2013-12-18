class CampaignsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :show]
  before_action :set_campaign, only: [:show, :edit, :update]

  def index
    @campaigns = @user.campaigns
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = @user.campaigns.create(campaigns_params)
    binding.pry
    redirect_to campaign_path(@campaign)
  end

  def send_email
    Resque.enqueue(SendBackgroundEmail, @user.campaigns.recipients, params)
    redirect_to root_url, notice: "Email sent"
  end


  def show
  end

  def edit
  end

  def update
    params[:campaign][:recipient_ids].select(&:present?).each do |recipient_id|
      @campaign.recipients << Recipient.find(recipient_id)
      redirect_to campaign_path(@campaign)
    end
  end


  private

  def campaigns_params
    params.require(:campaign).permit(:name,:id,:recipient_ids)
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_campaign
    @campaign = Campaign.find_by(id: params[:id])
  end
end