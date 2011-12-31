class ChoreType < ActiveRecord::Base
  has_many :chores
  validates_presence_of :action, :points
end