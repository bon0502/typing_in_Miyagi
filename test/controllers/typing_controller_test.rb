require "test_helper"

class TypingControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get typing_show_url
    assert_response :success
  end
end
