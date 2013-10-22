class RecipientsController < ApplicationController
  
  def index
    @recipient = Recipient.new
    # @recipient = Recipient.text_search(params[:query])
    # respond_to do |format|
    #   format.html
    #   format.csv { send_data @recipents.to_csv }
    # end
  end

  def create
    @recipient = Recipient.create(recipient_params)
    render :show
  end
  
  def show
    
  end
end


private

  def recipient_params
    params.require(:recipient).permit(:name, :email,:user_id)
  end