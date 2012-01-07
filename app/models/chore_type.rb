class ChoreType < ActiveRecord::Base
  has_many :chores
  validates_presence_of :action, :points
  
  def to_s
    "#{action} in my pants"
  end
end