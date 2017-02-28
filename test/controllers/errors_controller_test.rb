require 'test_helper'

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get 404" do
    get error_404_url
    assert_response :missing
  end

  test "should get 500" do
    get error_500_url
    assert_response :error
  end

end
