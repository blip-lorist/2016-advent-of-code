require "minitest/autorun"
require "./day_08.rb"

describe "start_display" do 
  it "returns hash map with width x height keys representing each pixel" do 
    width = 7 
    height = 3
    expected_count = width * height
    assert(expected_count,start_display(width, height).keys.count)
  end
end

