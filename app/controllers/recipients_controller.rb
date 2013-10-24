class RecipientsController < ApplicationController
  
  def index
    @recipients = Recipient.all 
  end

  def create
    @recipient = Recipient.create(recipient_params)
    respond_to do |format|
      format.csv { send_data @recipents.to_csv }
    end 
  end

  def new
    @recipient = Recipient.new
      
  end
  

  def show
    @recipient = Recipient.find(recipient_params)
  end

  private

  def recipient_params
    params.require(:recipient).permit(:name, :email, :users_id)
  end

end

# @recipient = Recipient.text_search(params[:query])
