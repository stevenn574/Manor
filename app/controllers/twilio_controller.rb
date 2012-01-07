class TwilioController < ApplicationController

  def index
    @user = User.find_by_phone_number(params[:from])
    if @user && params[:AccountSid] == ACCOUNT_SID
      body = params[:body]
      points = body.to_i
      action = body[2..body.length]
      @chore = Chore.new(:action => action, :points => points, :user => @user)
    end
  end
end

