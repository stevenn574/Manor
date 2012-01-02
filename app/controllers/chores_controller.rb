class ChoresController < ApplicationController
  def index
    @chores = Chore.all
  end
  
  def new
    
  end
  
  def create
    @chore = Chore.new(params[:chore])
    @chore.user = current_user
    @chore.save
  end
end