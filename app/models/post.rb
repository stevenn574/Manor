class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :post
  
  def to_s
    post
  end
  
end