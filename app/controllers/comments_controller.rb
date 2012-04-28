class CommentsController < ApplicationController
   before_filter :need_to_be_connected, :only => :delete
  def create
    p = Post.find_by_id(params[:post_id])
    @comment = p.comments.create(params[:comment])
    #redirect_to(show_post_path(p))
    respond_to do |format|
        format.html { redirect_to show_post_path(p)}
        format.json { render json: @comment}
        format.js
    end
  end
  
  
  def delete
    p = Post.find_by_id(params[:post_id])
    @comment = p.comments.find(params[:id])
    @comment.destroy
    #redirect_to(show_post_path(p))
    respond_to do |format|
        format.html { redirect_to show_post_path(p)}
        format.json { render json: @comment}
        format.js
    end
  end
end
