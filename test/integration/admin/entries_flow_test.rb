require 'test_helper'

class Admin::EntriesFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in users(:gvescu)
  end
  
  test "article created successfully" do
    get new_admin_entry_url(entry_type: 'articles')
    assert :success
  end

end
