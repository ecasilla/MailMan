class TemplatesController < ApplicationController
  
  def index
    @template = Template.all
  end

  def new
    @template = Template.new
    render :index 
  end

  def create
    @template = Template.create(template_params)
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