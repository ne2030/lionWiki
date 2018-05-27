require 'test_helper'

class ContentControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get content_edit_url
    assert_response :success
  end

  test "should get update" do
    get content_update_url
    assert_response :success
  end

end
