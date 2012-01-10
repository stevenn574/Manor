class TwilioController < ApplicationController
  skip_filter :authenticate_user!
  
  def index
    @user = User.find_by_phone_number(params[:From])
    if @user && params[:AccountSid] == ACCOUNT_SID
      body = params[:Body]
      points = body.to_i
      message = body.split " "
      action = message[1..message.length].join " "
      @chore = Chore.create(:action => action, :points => points, :user => @user)
    end
    render :nothing => true
  end
end

