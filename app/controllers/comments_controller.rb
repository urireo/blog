class CommentsController < ApplicationController
  before_action :set_post
  def create
    set_post
    @comment= @post.comments.create(comment_params)
    redirect_to @post
  end
  def edit
    set_post
    @comment= Comment.find(params[:id])
  end
  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to @post
  end
  def destroy
    @comment =Comment.find(params[:id])
    @comment.destroy
    redirect_to @post

  end

  private
  def  set_post
      @post=Post.find(params[:post_id])
  end
  def comment_params
    params.require(:comment).permit(:name, :content)
  end

end
