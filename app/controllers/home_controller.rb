class HomeController < ApplicationController
  def index
    @posts = current_user.new_posts
    @chores = Chore.today.by_newest
    @bills = Bill.all
  end
end