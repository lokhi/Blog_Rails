class CommentsController < ApplicationController
  def create
    p=Post.find_by_id(params[:post_id])
    c = p.comments.new(params[:comment])
    c.save
    redirect_to(show_post_path(p))
  end
end
