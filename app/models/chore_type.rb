class ChoreType < ActiveRecord::Base
  has_many :chores
  validates_presence_of :action, :points
  
  def to_s
    "#{action} like a boss"
  end
end