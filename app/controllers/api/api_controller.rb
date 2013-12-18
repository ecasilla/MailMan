class ApiController < ApplicationController
  before_filter :restrict_access
  respond_to :json
# Actions omitted

  def index
    @access_token = ApiKey.find_by(params [:user_id])
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
    authenticate_or_request_with_http_token do |token, options|
    ApiKey.exists?(access_token: token)
  end
end