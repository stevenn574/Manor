class Chore < ActiveRecord::Base
  belongs_to :chore_type
  belongs_to :user
  validates_presence_of :points, :action, :user
    
  before_create :set_defaults
  
  scope :by_newest, order('id DESC')
  scope :today, where( 'DATE(created_at) = DATE(?)', Time.now )
  scope :not_today, where( 'DATE(created_at) < DATE(?)', Time.now )
  scope :points, sum(:points)
  
  #delegate :action, :to => :chore_type  
  
  def set_defaults
    if chore_type
      self.action = chore_type.action
      self.points = chore_type.points
    end
  end

end