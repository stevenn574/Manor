class ChoresController < ApplicationController
  def index
    @chores = Chore.includes(:chore_type).all
  end
  
  def new
    
  end
  
  def create
    @chore = Chore.new(params[:chore])
    @chore.user = current_user
    return unless @chore.save
    @chores = Chore.includes(:chore_type).all
    respond_to do |format|
      format.html do
        render :index
      end
      format.js
    end
  end
end