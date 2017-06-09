require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get students_create_url
    assert_response :success
  end

  test "should get set_students" do
    get students_set_students_url
    assert_response :success
  end

end
