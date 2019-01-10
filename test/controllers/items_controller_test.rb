require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get items_list_url
    assert_response :success
  end

end
