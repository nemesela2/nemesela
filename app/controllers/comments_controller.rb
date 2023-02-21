class CommentsController < ApplicationController
  before_action :fetch_post

  def create
    @comment = @post.comments.create(params[:comment].permit(:name, :body))
    redirect_to post_path(@post)
  end

  def destroy
    @post.comments.find(params[:id]).destroy
    redirect_to post_path(@post)
  end

  private

  def fetch_post
    @post = Post.find(params[:post_id])
  end
end