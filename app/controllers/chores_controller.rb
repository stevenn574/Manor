class ChoresController < ApplicationController
  def index
    @chores = todays_chores
    @old_chores = Chore.includes(:chore_type).not_today.by_newest
  end
  
  def new
    
  end
  
  def create
    @chore = Chore.new(params[:chore])
    @chore.user = current_user
    @chore.save
    respond_to do |format|
      format.js
    end
  end
  def update
    @chore = Chore.find(params[:id])
    @chore.update_attributes(params[:chore]) if @chore.user == current_user
  end
  
  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy if @chore.user == current_user
  end
  
  private
  
  def todays_chores
    Chore.includes(:chore_type).today.by_newest
  end
end