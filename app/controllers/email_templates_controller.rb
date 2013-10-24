class EmailTemplatesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :show]
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
    @email_template = EmailTemplate.create(template_params)
    redirect_to user_campaigns_path(@user, @campaign)
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

  def set_user
    @user = User.find_by(id: params[:user_id].split("-").first)
  end

  def set_campaign 
    @campaign = Campaign.find_by(id: params[:campaign_id].split("-").first)
  end