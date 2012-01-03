class ChoreTypesController < ApplicationController
  def index
    
  end
  
  def new
    
  end
  
  def create
    @chore_type = ChoreType.new(params[:chore_type])
    if @chore_type.save
      render :new
    end
  end
end