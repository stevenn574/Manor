class Bill < ActiveRecord::Base
  belongs_to :user
  has_many :payments, :dependent => :destroy
  has_many :users, :through => :payments
  
  validates_presence_of :name, :amount
  
  attr_accessible :name, :description, :amount, :user_id
  
  scope :outstanding, joins(:payments).where(:paid => nil)
  
  def to_s
    "#{name}"
  end
  
  

end