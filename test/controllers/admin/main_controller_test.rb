require 'test_helper'

class Admin::MainControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get admin index if authenticated" do
    sign_in users(:gvescu)
    get admin_main_index_url
    assert_response :success
  end

  test "should redirect to sign_in if not authenticated" do
    get admin_main_index_url
    assert_redirected_to new_user_session_url
  end

end
