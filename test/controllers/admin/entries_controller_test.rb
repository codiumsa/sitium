require 'test_helper'

class Admin::EntriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get correct route according to entry_type" do
    e = entries(:one)
    assert_generates "/admin/#{e.entry_type}/#{e.id}/edit", { controller: 'admin/entries', action: 'edit', entry_type: e.entry_type, id: e.id }
  end

end
