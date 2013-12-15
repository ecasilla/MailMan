class ApiController < ApplicationController
  before_filter :restrict_access
  respond_to :json
# Actions omitted

  def get
  @campaign = User.campaign.all
  respond_to do |format|
    format.html
    format.json { render json: @campaign }
  end
  end

  def add

  end

  def delete

  end
private
  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end
end