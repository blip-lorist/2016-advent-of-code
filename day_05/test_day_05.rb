require "minitest/autorun"
require "./day_05.rb"

describe "md5 hash" do
  it "returns an md5 hash of a door id and integer" do
    unencrypted_string = "abc1" 
    md5_string = md5_encrypt(unencrypted_string)
    assert_equal(md5_string, "23734cd52ad4a4fb877d8a1e26e5df5f")
  end
end

describe "get_password_character" do 
  it "returns the sixth character of an encrypted string" do
    unencrypted_string = "abc3231929"
    assert_equal(get_password_character(unencrypted_string), "1")
  end
end

 describe "build_password" do 
   it "returns an eight-character password" do
     door_id = "abc"
     password = build_password(door_id)
     assert_equal(password, "18f47a30")
   end
 end
