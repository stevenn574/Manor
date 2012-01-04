class Chore < ActiveRecord::Base
  belongs_to :chore_type
  belongs_to :user
  validates_presence_of :chore_type, :user
  
  before_create :set_points
  
  default_scope order('id DESC')
  scope :today, where('DATE(created_at) = DATE(?)', Time.now )
  
  delegate :action, :to => :chore_type  
  def set_points
    self.points = chore_type.points
  end

end