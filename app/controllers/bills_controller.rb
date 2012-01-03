class BillsController < ApplicationController
  
  def index
    @bills = current_user.bills
  end
  
  def create
    @bill = Bill.new(params[:bill])
    @bill.user = current_user
    @bill.save
    render :new
  end
  
end