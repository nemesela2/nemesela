module Api
  class PostsController < ApiController
    def index
      render json: current_user.posts
    end
  end
end
