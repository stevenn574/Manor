class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :bill
  
  validates_presence_of :user_id, :bill_id
  
  def paid?
    self.paid
  end
  
end