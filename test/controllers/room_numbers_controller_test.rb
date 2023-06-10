require 'test_helper'

class RoomNumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get room_numbers_new_url
    assert_response :success
  end

  test "should get create" do
    get room_numbers_create_url
    assert_response :success
  end

end
