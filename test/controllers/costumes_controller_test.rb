require "test_helper"

class CostumesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get costumes_new_url
    assert_response :success
  end

  test "should get create" do
    get costumes_create_url
    assert_response :success
  end

  test "should get show" do
    get costumes_show_url
    assert_response :success
  end

  test "should get edit" do
    get costumes_edit_url
    assert_response :success
  end

  test "should get update" do
    get costumes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get costumes_destroy_url
    assert_response :success
  end
end
