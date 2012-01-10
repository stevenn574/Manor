class HomeController < ApplicationController
  def index
    @posts = current_user.new_posts
    @bills = Bill.all
  end
end