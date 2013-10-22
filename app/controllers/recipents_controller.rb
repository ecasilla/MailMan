class RecipentsController < ApplicationController
  
  def index
    @recipents = Recipent.text_search(params[:query])
    respond_to do |format|
      format.html
      format.csv { send_data @recipents.to_csv }
    end
  end

  def import
    @recipents = Recipent.import(params[:name], params[:email])
  end
  
  def show
    
  end
end