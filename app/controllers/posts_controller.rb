class PostsController < ApplicationController
  before_filter :need_to_be_connected, :except => [:index, :show, :search]
  def index
    @posts = Post.all  
   # respond_to do |format|
    #  format.html
     # format.rss { render :rss => @posts, :layout => false}
    #end
  end
  
  def new
    @post = Post.new
  end
 
  def create
    post = Post.new(params[:post])
    post.save
    redirect_to(posts_path)
  end
  
  def edit
    @post = Post.find_by_id(params[:id])
  end
  
  def update
    post = Post.find_by_id(params[:id])
    post.update_attributes(params[:post])
    redirect_to(posts_path)
  end
  
  def show
    @post = Post.find_by_id(params[:id])
  end
  
  def delete
    post = Post.find_by_id(params[:id])
    post.destroy
    redirect_to(posts_path)
  end
  
  def search
    val=params[:search]
    @posts = Post.where("title like '%#{val}%' or body like '%#{val}%'")
    render :index
  end
  
end
