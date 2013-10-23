class CampaignsController < ApplicationController
  
  def index
    @user = User.find_by(id: params[:user_id].split("-").first)
    @email_template = EmailTemplate.all
    @recipients = Recipient.all
  end

  def new
    @user = User.find_by(id: params[:user_id].split("-").first)
    @email_template = EmailTemplate.all
    @recipients = Recipient.all
  end

  def create
    @user = User.find_by(id: params[:user_id].split("-").first)
    @email_template = EmailTemplate.new
  end

  def show
    @user = User.find_by(id: params[:user_id].split("-").first)
  end

  def edit
    
  end

  def delete
    
  end
end