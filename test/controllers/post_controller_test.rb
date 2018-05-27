require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_new_url
    assert_response :success
  end

  test "should get create" do
    get post_create_url
    assert_response :success
  end

  test "should get edit" do
    get post_edit_url
    assert_response :success
  end

  test "should get update" do
    get post_update_url
    assert_response :success
  end

  test "should get search" do
    get post_search_url
    assert_response :success
  end

  test "should get detail" do
    get post_detail_url
    assert_response :success
  end

end
