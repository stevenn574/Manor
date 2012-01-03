class Chore < ActiveRecord::Base
  belongs_to :chore_type
  belongs_to :user
  validates_presence_of :chore_type, :user
  
  delegate :action, :to => :chore_type
  
  default_scope order('id DESC')

end