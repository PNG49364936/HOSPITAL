require 'test_helper'

class ChambresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chambres_index_url
    assert_response :success
  end

  test "should get show" do
    get chambres_show_url
    assert_response :success
  end

  test "should get new" do
    get chambres_new_url
    assert_response :success
  end

  test "should get create" do
    get chambres_create_url
    assert_response :success
  end

  test "should get edit" do
    get chambres_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get chambres_destroy_url
    assert_response :success
  end

  test "should get update" do
    get chambres_update_url
    assert_response :success
  end

end
