class TemplatesController < ApplicationController
  
  def index
    @template = Template.all
  end

  def new
    @template = Template.new
    render :index 
  end

  def show
    
  end

  def edit
    
  end

  def delete
    
  end

end