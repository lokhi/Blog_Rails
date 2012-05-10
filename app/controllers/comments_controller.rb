class CommentsController < ApplicationController
   before_filter :need_to_be_connected, :only => :delete
  def create
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    if @comment.valid?
      respond_to do |format|
          format.html { redirect_to show_post_path(@post)}
          format.json { render json: @comment}
          format.js
      end
      else
        flash[:error]="Comment Fields must not be empty !"
        respond_to do |format|
          format.html { render "posts/show"}
          format.js   { render "comments/error"}
        end
     end
  end
  
  
  def delete
    p = Post.find_by_id(params[:post_id])
    @comment = p.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
        format.html { redirect_to show_post_path(p)}
        format.json { render json: @comment}
        format.js
    end
  end
end
