class Bill < ActiveRecord::Base
  belongs_to :user
  has_many :payments, :dependent => :destroy
  has_many :users, :through => :payments
  
  validates_presence_of :name, :amount
  
  attr_accessible :name, :description, :amount, :user_id
  
  scope :outstanding, joins(:payments).where("payments.paid = ?", false)

  def paid?(user)
    @payment = Payment.where('user_id = ? AND bill_id = ?', user.id, id)
    @payment.paid?
  end
  
  def to_s
    "#{name}"
  end

end