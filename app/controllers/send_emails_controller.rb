class SendEmailsController < ApplicationController

  def new
    render :new
  end

  def create
    @campaign = CampaignMailer.send_blast.deliver
  end

  def show
    render :show
  end
end