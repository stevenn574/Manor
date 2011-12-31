class HomeController < ApplicationController
  def index
    @chores = Chore.all
    
  end
end