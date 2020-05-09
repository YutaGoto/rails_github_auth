require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)

    OmniAuth.configure do |config|
      config.test_mode = true
      config.mock_auth[:github] = OmniAuth::AuthHash.new({
        provider: "github",
        uid: "111111111111111111111",
        info: { nickname: 'NameString' },
        credentials: { token: 12345 }
      })
    end
  end

  test "sign in and sign out" do
    get root_path

    assert_select "a[href=?]", "/auth/github"
    get "/auth/github"
    assert_redirected_to auth_github_callback_path
    follow_redirect!

    assert_redirected_to root_path
    follow_redirect!

    assert_select "li", "NAME: #{@user.name}"
    assert_select "a[href=?]", sign_out_path
    get sign_out_path
    assert_nil session[:user_id]
  end
end
