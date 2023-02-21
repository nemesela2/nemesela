require 'rails_helper'

RSpec.describe "Sessions" do
  it "signs user in and out" do
    user = create(:user)

    sign_in user

    get root_url
    expect(response).to be_successful

    sign_out user

    get root_url
    expect(response).to redirect_to(new_user_session_path)
  end
end
