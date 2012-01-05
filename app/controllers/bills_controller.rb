class BillsController < ApplicationController
  
  def index
    @bills = Bill.by_newest #current_user.bills.includes(:payments)
  end
  
  def create
    @bill = Bill.new(params[:bill])
    @bill.user = current_user
    @bill.save
    render :new
  end
  
  def pay
    #@bill = current_user.bills.find(params[:id])
    #@bill.pay current_user
    @payment = current_user.payments.find_by_bill_id params[:id]
    @payment.pay
    Rails.logger.info(@payment.inspect)
  end
  
end