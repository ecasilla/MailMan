class SendEmailsController < ApplicationController

  def new
    render :new
  end

  def send_email
    Resque.enqueue(SendBackgroundEmail, current_user.email, params)
    redirect_to root_url, notice: "Email sent"
  end

  def show
    render :show
  end
end