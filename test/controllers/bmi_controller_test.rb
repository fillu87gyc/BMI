require 'test_helper'

class BmiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bmi_index_url
    assert_response :success
  end

  test "should get show" do
    get bmi_show_url
    assert_response :success
  end

  test "should get create" do
    get bmi_create_url
    assert_response :success
  end

end
