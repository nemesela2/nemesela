require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  context 'With current user' do

    before do
      @comment_attr = attributes_for(:comment)
      @post = create(:post)
      login_with @post.user
    end

    it 'create a new comment with valid attributes' do
      expect {
        post :create, params: { post_id: @post.id, comment: @comment_attr }
      }.to change { Comment.count }.from(0).to(1)
    end

    it 'destroy comment' do
      post :create, params: { post_id: @post.id, comment: @comment_attr }
      expect {
        delete :destroy, params: { post_id: @post.id, id: Comment.last.id }
      }.to change { Comment.count }.from(1).to(0)
    end
  end
end
