class PostsController < ApplicationController
  def index
    @posts = Post.all  
  end
  
  def new
    @post = Post.new
  end
 
  def create
    p = Post.new(params[:post])
    p.save
    redirect_to(posts_path)
  end
  
end
