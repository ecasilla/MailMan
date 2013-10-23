class RecipientsController < ApplicationController
  
  def index
    @recipient = Recipient.all
    # @recipient = Recipient.text_search(params[:query])
    # respond_to do |format|
    #   format.html
    #   format.csv { send_data @recipents.to_csv }
    #end    
  end

  def create
    @recipient = Recipient.create(recipient_params)
    render :show
  end

  def new
    @recipient = Recipient.new
  end
  
  def show
  end

  private

  def recipient_params
    params.require(:recipient).permit(:name, :email, :users_id)
  end

end


