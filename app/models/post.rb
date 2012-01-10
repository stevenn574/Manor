class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :post
  
  scope :new_since, lambda { |date| where('created_at > ?', date).order('id desc') }
  
  def to_s
    post
  end
  
end