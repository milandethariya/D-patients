require 'test_helper'

class DoctortimeslotsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get doctortimeslots_new_url
    assert_response :success
  end

end
