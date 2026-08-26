require "test_helper"

class TypingControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    user = User.create!(
      email: "typing_test@example.com",
      password: "password",
      password_confirmation: "password",
      nickname: "タイピングテストユーザー"
    )
    course = courses(:one)

    login_as(user)

    get typing_path(course.id)

    assert_response :success
  end
end
