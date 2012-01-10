class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end
  
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    @post.save
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy if @post.user == current_user
  end
  
end