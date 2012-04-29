class PostsController < ApplicationController
  before_filter :need_to_be_connected, :except => [:index, :show, :search]
  def index
    #@posts = Post.all  
    @posts = Post.paginate(:page => params[:page],:per_page=> 3)
    respond_to do |format|
      format.html
      format.rss { render :layout => false}
      format.json { render json: @posts }
    end
  end
  
  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(params[:post])
    @post.save
    flash[:msg] = "Post was created with success :) !"
    #redirect_to()
    respond_to do |format|
        format.html { redirect_to posts_path}
        format.json { render json: @post}
        format.js
    end
  end
  
  def edit
    @post = Post.find_by_id(params[:id])
     respond_to do |format|
        format.html
        format.json { render json: @post}
        format.js
    end
  end
  
  def update
    @post = Post.find_by_id(params[:id])
    @post.update_attributes(params[:post])
    flash[:msg] = "Post was updated with success :) !"
    #redirect_to(posts_path)
     respond_to do |format|
        format.html { redirect_to posts_path}
        format.json { render json: @post}
        format.js
    end
  end
  
  def show
    @post = Post.find_by_id(params[:id])
  end
  
  def delete
    @post = Post.find_by_id(params[:id])
    @post.destroy
    #redirect_to(posts_path)
    respond_to do |format|
        format.html { redirect_to posts_path}
        format.json { render json: @post}
        format.js
    end
  end
  
  def search
    val=params[:search]
    @posts = Post.where("title like '%#{val}%' or body like '%#{val}%'")
    flash[:search] = "No posts found. Try a different search ?" if @posts.empty?
    render :index
  end
  
end
