class EmailTemplatesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :show]
  before_action :set_campaign, only: [:index, :new, :create, :show]
  
  def index
    @email_template = EmailTemplate.all
  end

  def new
    @email_template = EmailTemplate.new
    @campaign
    @user
  end

  def create
    @email_template = @campaign.create(template_params)
    redirect_to user_campaign_path(@user, @campaign)
  end

  def show
     @email_template = EmailTemplate.find(email_params[:id])
  end

  def update
    if @email_template.update_attributes(email_params)
      redirect_to user_campaign_path(@user, @campaign)
    else
      render :edit
    end
  end

  def delete
    if @email_template.destroy
      redirect_to user_campaign_path(@user, @campaign)
    else
      render :edit
    end
  end

end

 private

  def template_params
    params.require(:template).permit(:name,:body)
  end

  def set_user
    @user = User.find_by(id: params[:user_id].split("-").first)
  end

  def set_campagn 
    @user = Campaign.find_by(id: params[:campaign_id].split("-").first)
  end