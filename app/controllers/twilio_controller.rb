class TwilioController < ApplicationController
  skip_filter :authenticate_user!
  
  def index
    @user = User.find_by_phone_number(params[:From])
    if @user #&& params[:AccountSid] == ACCOUNT_SID
      Rails.logger.info "!!!!!!!!!!!!!!! FOUND A USER!"
      body = params[:Body]
      type = body.split(" ")[0]
      if is_number?(type)
        create_chore(@user, body)
      elsif type.capitalize == "P"
        create_post(@user, body)   
      end
    end
    render :nothing => true
  end
  
  private
  
  def create_chore(user, body)
    points = body.to_i
    message = body.split " "
    action = message[1..message.length].join " "
    @chore = Chore.create(:action => action, :points => points, :user => user)
  end
  
  def create_post(user, body)
    message = body.split " "
    post = message[1..message.length].join " "
    @post = Post.create(:post => post, :user => user)
  end
  
  def is_number?(object)
    true if Float(object) rescue false
  end

end

