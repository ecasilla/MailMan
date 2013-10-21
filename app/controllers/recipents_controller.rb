class RecipentsController < ApplicationController
  
  def index
    @recipents = Recipents.all
    respond_to do |format|
      format.html
      format.csv { send_data @recipents.to_csv }
    end
  end

  def import
    @recipents = Recipents.import(params[:name], params[:email])
  end
end