class PostsController < ApplicationController
  before_action :fetch_post, only: [:show, :update, :edit, :destroy]

  def index
    if params[:search]
      @posts = current_user.posts.search(params[:search][:query])
    else
      @posts = current_user.posts.order(created_at: :desc)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to @post
    else
      flash[:error] = 'Creation failed! ' + @post.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def show
    @comments = @post.comments
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post was successfully updated.'
      redirect_to @post
    else
      flash[:error] = 'Update failed! ' + @post.errors.full_messages.join(', ')
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted successfully.'

    redirect_to posts_path
  end

  private

  def fetch_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
