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
  
  it "returns sector id for real room with all ties" do
    sector_id = real_room_sector_id("a-b-c-d-e-f-g-h-987[abcde]")
    assert_equal(sector_id, 987)
  end

  it "returns sector id for real room unordered letters" do
    sector_id = real_room_sector_id("not-a-real-room-404[oarel]")
    assert_equal(sector_id, 404)
  end

  it "returns 0 for unreal room " do
    sector_id = real_room_sector_id("totally-real-room-200[decoy]")
    assert_equal(sector_id, 0)
  end

end

