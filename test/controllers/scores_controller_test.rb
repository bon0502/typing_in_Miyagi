require "test_helper"

class ScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(
      email: "test@example.com",
      password: "password",
      password_confirmation: "password",
      nickname: "テストユーザー"
    )
    @course = Course.create!(name: "テストコース")
    post login_url, params: { email: @user.email, password: "password" }
  end

  test "should get index" do
    get scores_url
    assert_response :success
  end

  test "should get create" do
    post scores_url, params: { score: { score: 100, course_id: @course.id } }
    assert_response :success
  end
end
