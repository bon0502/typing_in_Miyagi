require "test_helper"

class UserSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(
      email: "test@example.com",
      password: "password",
      password_confirmation: "password",
      nickname: "テストユーザー"
    )
    post login_url, params: { email: @user.email, password: "password" }
  end

  test "should get show" do
    get user_setting_url
    assert_response :success
  end

  test "should get edit" do
    get edit_user_setting_url
    assert_response :success
  end

  test "should get update" do
    get user_setting_url, params: { user: { nickname: "新しいニックネーム" } }
    assert_response :success
  end
end
