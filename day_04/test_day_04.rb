require "minitest/autorun"
require "./day_04.rb"

describe "identifies a real room" do
  it "returns true based on frequency with no ties" do
    decision = real_room?("aaaaa-bbbb-zzz-yy-x-123[abzyx]")
    assert_equal(decision, true)
  end
end

