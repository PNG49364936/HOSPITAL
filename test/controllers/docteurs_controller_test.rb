require 'test_helper'

class DocteursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get docteurs_index_url
    assert_response :success
  end

  test "should get show" do
    get docteurs_show_url
    assert_response :success
  end

  test "should get new" do
    get docteurs_new_url
    assert_response :success
  end

  test "should get create" do
    get docteurs_create_url
    assert_response :success
  end

  test "should get edit" do
    get docteurs_edit_url
    assert_response :success
  end

  test "should get update" do
    get docteurs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get docteurs_destroy_url
    assert_response :success
  end

end
