class ChoreTypesController < ApplicationController
  def index
    
  end
  
  def new
    
  end
  
  def create
    @chore_type = ChoreType.create(params[:chore_type])
  end
end