class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  
  has_many :payments
  has_many :bills, :through => :payments
  has_many :chores
  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  validates_presence_of :email, :name
  
  def to_s
    name
  end
  
  def self.points
    self.chores.includes(:chore_type)
  end
end
