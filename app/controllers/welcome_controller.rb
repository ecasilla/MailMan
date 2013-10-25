class WelcomeController < ApplicationController
  def index
    render :index
  end

  def about
    render :about
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email,:comment)
  end

end

