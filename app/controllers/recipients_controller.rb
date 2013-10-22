class RecipientsController < ApplicationController
  
  def index
    @recipients = Recipient.text_search(params[:query])
    respond_to do |format|
      format.html
      format.csv { send_data @recipents.to_csv }
    end
  end

  def import
    @recipients = Recipient.import(params[:name], params[:email])
  end
  
  def show
    
  end
end