class TwilioController < ApplicationController

  def index
    Rails.logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! TWILIO PARAMS: #{params}")
  end
end