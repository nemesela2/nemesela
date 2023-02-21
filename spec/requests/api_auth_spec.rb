require 'rails_helper'
include ActionController::RespondWith

# The authentication header looks something like this:
# {"access-token"=>"abcd1dMVlvW2BT67xIAS_A", "token-type"=>"Bearer", "client"=>"LSJEVZ7Pq6DX5LXvOWMq1w", "expiry"=>"1519086891", "uid"=>"test@email.com"}

describe "Whether access is ocurring properly", type: :request do
  before do
    @current_user = create(:user)
  end

  context "context: general authentication via API, " do
    it "doesn't give you anything if you don't log in" do
      get api_posts_path
      expect(response.status).to eq(401)
    end

    it "gives you an authentication code if you are an existing user and you satisfy the password" do
      login
      # puts "#{response.headers.inspect}"
      # puts "#{response.body.inspect}"
      expect(response.has_header?('access-token')).to eq(true)
    end

    it "gives you a status 200 on signing in " do
      login
      expect(response.status).to eq(200)
    end

    it "gives you an authentication code if you are an existing user and you satisfy the password" do
      login
      expect(response.has_header?('access-token')).to eq(true)
    end

    it "deny access to a restricted page with an incorrect token" do
      login
      auth_params = get_auth_params_from_login_response_headers(response)
      auth_params['access-token'] = 'invalid_token'
      get api_posts_path, headers: auth_params
      expect(response).not_to have_http_status(:success)
    end
  end

  def login
    post api_user_session_path, params:  { email: @current_user.email, password: "12345678"}.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end

  def get_auth_params_from_login_response_headers(response)
    client = response.headers['client']
    token = response.headers['access-token']
    expiry = response.headers['expiry']
    token_type = response.headers['token-type']
    uid =   response.headers['uid']

    auth_params = {
        'access-token' => token,
        'client' => client,
        'uid' => uid,
        'expiry' => expiry,
        'token_type' => token_type
    }
    auth_params
  end
end