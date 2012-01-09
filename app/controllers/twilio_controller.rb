class TwilioController < ApplicationController
  skip_filter :authenticate_user!
  
  def index
    @user = User.find_by_phone_number(params[:From])
    if @user && params[:AccountSid] == ACCOUNT_SID
      points = body.to_i
      action = body.split " "
      action = action.join[1..action.length].join " "
      @chore = Chore.create(:action => action, :points => points, :user => @user)
    end
    render :nothing => true
  end
end

