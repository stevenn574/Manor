class TwilioController < ApplicationController
  skip_filter :authenticate_user!
  
  def index
    @user = User.find_by_phone_number(params[:From])
    Rails.logger.info "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#{@user}"
    if @user #&& params[:AccountSid] == ACCOUNT_SID
      body = params[:Body]
      points = body.to_i
      message = body.split " "
      Rails.logger.info "!!!!!!!!!!!!!!!!!!!!!!!!!!! #{message}"
      action = message[1..message.length].join " "
      @chore = Chore.create(:action => action, :points => points, :user => @user)
    end
    render :nothing => true
  end
end

