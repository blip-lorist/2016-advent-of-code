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

def supports_ssl?(ip_address)
  maybe_babs = get_possible_babs(ip_address)
  character_chunks = []
  leading_characters = ip_address.split("[").first
  trailing_characters = ip_address.split("]").last
  character_chunks << leading_characters 
  character_chunks << trailing_characters

  ip_address.scan(/\](.*?)\[/) { 
      in_between_match = $1
      character_chunks << in_between_match 
  }

  character_chunks.each do |chunk|
    maybe_babs.each do |maybe_bab|
      aba = maybe_bab[1] + maybe_bab[0] + maybe_bab[1]
      if chunk.include?(aba)
        return true
      end
    end
  end

  return false
end

def get_possible_babs(ip_address)
  match = ""
  possible_babs = []
  ip_address.scan(/\[(.*?)\]/) {
    match = $1
    if match.length == 3
      possible_babs << match
    end
  }
  return possible_babs
end
#process_input

