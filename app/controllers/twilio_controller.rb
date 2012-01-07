class TwilioController < ApplicationController
  skip_filter :authenticate_user!

  def index
    @user = User.find_by_phone_number(params[:from])
    if @user && params[:AccountSid] == ACCOUNT_SID
      body = params[:body]
      points = body.to_i
      action = body[2..body.length]
      @chore = Chore.create(:action => action, :points => points, :user => @user)
    end
  end
end

