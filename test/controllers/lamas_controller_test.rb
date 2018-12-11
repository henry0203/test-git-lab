require 'test_helper'

class LamasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lamas_index_url
    assert_response :success
  end

  test "should get show" do
    get lamas_show_url
    assert_response :success
  end

  test "should get new" do
    get lamas_new_url
    assert_response :success
  end

  test "should get create" do
    get lamas_create_url
    assert_response :success
  end

  test "should get edit" do
    get lamas_edit_url
    assert_response :success
  end

  test "should get update" do
    get lamas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get lamas_destroy_url
    assert_response :success
  end

end
