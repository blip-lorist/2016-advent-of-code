require "minitest/autorun"
require "./day_07.rb"

describe "is_abba?" do 
  it "identifies strings with ABBAs" do 
    assert(is_abba?("xyyx"))
    refute(is_abba?("xyzx")) # not palindrome
    refute(is_abba?("xyzyx")) # not 4 characters
    refute(is_abba?("aaaa")) # not all the same
  end
end

describe "has_abba?" do 
  it "finds abba in a larger string" do 
    assert(has_abba?("ixyyxz"))
  end
end

describe "return possible babs" do
  it "returns true if ip supports ssl" do 
#    assert_equal(["bab"],get_possible_babs("aba[bab]xyz"))
#    assert_equal(["bab","fof"],get_possible_babs("aba[bab]xyz[fof]eie"))
  end
end

describe "supports_ssl?" do
  it "returns true if ip supports ssl" do 
    assert(supports_ssl?("aba[bab]xyz"))
    assert(supports_ssl?("aaa[kek]eke"))
    assert(supports_ssl?("zazbz[bzb]cdb"))
  end

  it "returns false if doesn't support ssl" do 
    refute(supports_ssl?("xyx[xyx]xyx"))
  end
end

describe "abba_in_brackets?" do 
  it "returns true if abba is in brackets" do 
    input = "abcd[bddb]xyyx" 
    assert(abba_in_brackets?(input))
  end

  it "returns true if abba is in second set of brackets" do 
    input = "abcd[asdf]jklo[bddb]xyyx" 
    assert(abba_in_brackets?(input))
  end

  it "returns false if abba is not in brackets" do 
    input = "abcd[bcdb]xyyx" 
    refute(abba_in_brackets?(input))
  end
end

describe "supports_tls?" do 
  it "returns true when tls supported" do 
    assert(supports_tls?("abba[mnop]qrst"))
    assert(supports_tls?("qrst[mnop]abba"))
    assert(supports_tls?("oxxoj[asdfgh]zxcvbn"))
    assert(supports_tls?("oxoj[asdfgh]zxcv[piou]nbbn[qwed]asdf"))
  end

  it "returns false when TLS not supported" do 
    refute(supports_tls?("abcd[bddb]xyyx"))
    refute(supports_tls?("aaaa[qwer]tyui"))
  end
end
