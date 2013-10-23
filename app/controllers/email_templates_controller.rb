class EmailTemplatesController < ApplicationController
  
  def index
    @template = EmailTemplate.all
  end

  def new
    @template = EmailTemplate.new
    render :new 
  end

  def create
    @template = EmailTemplate.create(template_params)
  end

  def show
    
  end

  def edit
    
  end

  def delete
    
  end

end

 private

  def template_params
    params.require(:template).permit(:name,:text)
  end