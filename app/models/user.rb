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
  
  def new_posts
    Post.new_since(last_sign_in_at)
  end
  
  def points
    self.chores.sum('points')
  end
  
  def send_text(message)
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    
    @client.account.sms.messages.create(
      :from => PHONE_NUMBER,
      :to => phone_number,
      :body => message
    )
  end
  
end
