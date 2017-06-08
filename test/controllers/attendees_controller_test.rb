require 'test_helper'

class AttendeesControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get attendees_register_url
    assert_response :success
  end

  test "should get deregister" do
    get attendees_deregister_url
    assert_response :success
  end

end
