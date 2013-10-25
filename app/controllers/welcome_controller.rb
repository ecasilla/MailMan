class WelcomeController < ApplicationController
  def index
    render :index
  end

  def about
    render :about
  end

  def contact
    @contact_us = Contact.create
    render :contact
  end
end