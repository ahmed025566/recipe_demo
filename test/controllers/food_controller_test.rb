require "test_helper"

class FoodControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get food_new_url
    assert_response :success
  end

  test "should get create" do
    get food_create_url
    assert_response :success
  end
end
