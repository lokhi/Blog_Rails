class CommentsController < ApplicationController
  def create
    p = Post.find_by_id(params[:post_id])
    p.comments.create(params[:comment])
    redirect_to(show_post_path(p))
  end
end
