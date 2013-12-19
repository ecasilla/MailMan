class RecipientsController < ApplicationController 
  before_action :set_user, only: [:index, :create]

  def index
    @recipients = @user.recipients
  end

  def create
      @recipient = Recipient.new(recipient_params)
      @recipient.user = @user
    if @recipient.save
      redirect_to user_recipients_path(@user)
    else
      render :new
    end
  end

  def import
    begin
      Recipient.upload(params[:upload], current_user, params[:contact][:list_id])
      redirect_to :action => "index"
    rescue Exception => e
    end
  end


  def new
    @recipient = Recipient.new
  end

  private

  def recipient_params
    params.require(:recipient).permit(:first_name,:last_name, :email, :users_id,:phone)
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end
end