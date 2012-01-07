class TwilioController < ApplicationController
  skip_filter :authenticate_user!

  def index
    @user = User.find_by_phone_number(params[:from])
    if @user && params[:AccountSid] == ACCOUNT_SID
      body = params[:body]
      Rails.logger.info body
      points = body.to_i
      Rails.logger.info points
      action = body[2..body.length]
      Rails.logger.info action
      @chore = Chore.create(:action => action, :points => points, :user => @user)
      Rails.logger.info @chore.errors.inspect
    end
    render :nothing => true
  end
end

