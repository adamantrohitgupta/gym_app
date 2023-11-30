require "test_helper"

class GymClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gym_classes_index_url
    assert_response :success
  end

  test "should get show" do
    get gym_classes_show_url
    assert_response :success
  end

  test "should get new" do
    get gym_classes_new_url
    assert_response :success
  end

  test "should get edit" do
    get gym_classes_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get gym_classes_destroy_url
    assert_response :success
  end
end
