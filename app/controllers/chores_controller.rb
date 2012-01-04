class ChoresController < ApplicationController
  def index
    @chores = todays_chores
    @old_chores = Chore.includes(:chore_type).not_today.by_id
  end
  
  def new
    
  end
  
  def create
    @chore = Chore.new(params[:chore])
    @chore.user = current_user
    return unless @chore.save
    @chores = todays_chores
    respond_to do |format|
      format.html do
        render :index
      end
      format.js
    end
  end
  
  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy if @chore.user == current_user
    redirect_to chores_url
  end
  
  private
  
  def todays_chores
    Chore.includes(:chore_type).today.by_id 
  end
end