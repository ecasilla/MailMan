class WelcomeController < ApplicationController
  def index
    render :index
  end

  def about
    render :about
  end

  def create
    @contact_us = ContactUs.new
    if @contact_us.save
      flash[:notice] = "We will contact you shortly thanks!"
      redirect_to root_path
    else
      render :contact
   end
   
  end
end