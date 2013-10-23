class CampaignsController < ApplicationController
  
  def index
    @user = User.find_by(id: params[:user_id].split("-").first)
  end

  def new
  end

  def create
    
  end

  def show
    @user = User.find_by(id: params[:user_id].split("-").first)
    binding.pry
  end

  def edit
    
  end

  def delete
    
  end
end