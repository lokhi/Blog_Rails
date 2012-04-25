class CommentsController < ApplicationController
   before_filter :need_to_be_connected, :only => :delete
  def create
    p = Post.find_by_id(params[:post_id])
    p.comments.create(params[:comment])
    redirect_to(show_post_path(p))
  end
  
  
  def delete
    p = Post.find_by_id(params[:post_id])
    c = p.comments.find(params[:id])
    c.destroy
    redirect_to(show_post_path(p))
  end
end
