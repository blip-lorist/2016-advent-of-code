require "minitest/autorun"
require "./day_04.rb"

describe "identifies a real room" do
  it "returns sector id if real room based on frequency with no ties" do
    sector_id = real_room_sector_id("aaaaa-bbbb-zzz-yy-x-123[abzyx]")
    assert_equal(sector_id, 123)
  end

  it "returns sector ID if real room based on frequency and ties" do
    sector_id = real_room_sector_id("aaaaa-bbb-z-y-x-123[abxyz]")
    assert_equal(sector_id, 123)
  end

end

