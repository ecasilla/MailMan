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
      Recipient.import_csv(params[:file],current_user)
      redirect_to user_recipients_path(current_user)
    rescue => e
      flash[:error] = "Your file is invalid"
      redirect_to action: :new
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