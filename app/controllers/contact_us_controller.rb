class ContactUsController < ApplicationController
  def new
    @contact_us = ContactUs.new
  end

  def create
    @contact_us = ContactUs.new(name: params[:name], email: params[:email], comment: params[:comment])
    
    if @contact_us.save
      flash[:notice] = "We will contact you shortly thanks!"
      redirect_to root_path
    else
      redirect_to new_contact_path
    end
  end

end