require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test "validators" do
    entry = Entry.new
    refute entry.valid?
  end
end
