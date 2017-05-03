require 'set'

def is_abba?(string)
  if string.length == 4
    string_set = string.split("").to_set
    if string[0] == string[3] && string[1] == string[2] && string_set.count >= 2
      return true
    end
  end

  return false
end

def has_abba?(string)
  until string.length < 4
    first_four_chars = string[0..3]
    if is_abba?(first_four_chars)
      return true
    else 
      string[0] = ""
    end
  end

  return false
end

def abba_in_brackets?(string)
  match = ""
  matches = []
  string.scan(/\[(.*?)\]/) {
    match = $1
    matches << match
  }
  matches.each do |content|
    return true if has_abba?(content)
  end

  return false
end

def supports_tls?(string)
  if abba_in_brackets?(string)
    return false
  end

  first_half = string.split("[").first
  if has_abba?(first_half)
    return true 
  end

  last_half = string.split("]").last
  if has_abba?(last_half)
    return true 
  end

  in_between_match = ""
  in_between_matches = []
  string.scan(/\](.*?)\[/) { 
    in_between_match = $1
    in_between_matches << in_between_match 
  }
  in_between_matches.each do |match| 
    return true if has_abba?(match)
  end

  return false
end

def process_input
  counter = 0
  File.open('./input').each do |line|
    if supports_tls?(line)
      counter += 1
    end
  end

  puts counter
end

process_input

