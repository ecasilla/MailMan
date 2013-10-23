class EmailTemplatesController < ApplicationController
  
  def index
    @email_template = EmailTemplate.all
  end

  def new
    @email_template = EmailTemplate.new
 
  end

  def create
    @email_template = EmailTemplate.create(template_params)
    render :show
  end

  def show
     @email_template = EmailTemplate.find(email_params[:id])
  end

  def edit
    
  end

  def delete
    
  end

end

 private

  def template_params
    params.require(:template).permit(:name,:body)
  end