require "minitest/autorun"
require "./day_03.rb"

describe "determines if a triangle is possible" do
  it "returns a true or false decision" do
    decision = possible_triangle?([5, 10, 25])
    assert_equal(decision, false)
  end
end

