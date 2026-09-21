require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(
      email: "test@example.com",
      password: "password",
      password_confirmation: "password",
      nickname: "テストユーザー"
    )
  end

  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should create session" do
    post login_url, params: { email: @user.email, password: "password" }
    assert_response :redirect
  end

  test "should destroy session" do
    post login_url, params: { email: @user.email, password: "password" }
    delete logout_url
    assert_response :redirect
  end
end
