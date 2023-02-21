require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  context 'Unauthorized user' do
    it 'should be redirected to signin' do
      get :index
      expect( response ).to redirect_to( new_user_session_path )
    end
  end

  context 'Authorized user' do
    before do
      login_with create(:user)
    end

    it 'should let a user see all the posts' do
      get :index
      expect(response).to render_template( :index )
    end

    it 'should let a user filter the posts' do
      create(:post)
      get :index, params: { search: { query: 'desk' } }

      expect(response).to be_successful
    end

    it 'creates the post' do
      post :create, params: { post: attributes_for(:post) }
      expect(Post.count).to eq(1)
    end

    it 'redirects to the "show" action for the new post' do
      post :create, params: { post: attributes_for(:post) }
      expect(response).to redirect_to Post.first
    end

    it 'delete the post' do
      post = create(:post)
      delete :destroy, params: { id: post.id }
      expect(Post.count).to eq(0)
    end
  end
end
