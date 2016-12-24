require 'digest/md5'
class String
  def is_i?
    # http://stackoverflow.com/questions/1235863/test-if-a-string-is-basically-an-integer-in-quotes-using-ruby
    /\A[-+]?\d+\z/ === self 
  end
end

def md5_encrypt(string)
  Digest::MD5.hexdigest(string)
end

def get_password_character(string)
  encrypted_string = md5_encrypt(string)
  
  if encrypted_string.start_with?("00000")
    return encrypted_string[5]
  else
    return nil
  end
end

def get_password_position_and_character(string)
  encrypted_string = md5_encrypt(string)
  position_and_character = []

  if encrypted_string.start_with?("00000")

    position = encrypted_string[5]
    if position.is_i? && position.to_i.between?(0,7)
      position = position.to_i
      character = encrypted_string[6]
      position_and_character << position 
      position_and_character << character
      return position_and_character
    end
  else
    return nil
  end
end

def build_password(door_id, int=0, password=[])
  # Base case: when password length is 8
  until password.length == 8
    unencrypted_string = door_id + int.to_s
    next_character = get_password_character(unencrypted_string)
    if next_character
      password << next_character
    end
    int += 1
  end
  
  return password.join("")
end

def build_password_with_positions(door_id, int=0)
  password = Array.new(8, nil)

  # Locked elements - horribly inefficient. Shouldn't be processing the same element more than once. 
  locked_elements = []
  # Base case: when password array no longer contains nil
  while password.include?(nil) 
    unencrypted_string = door_id + int.to_s
    next_position_and_character = get_password_position_and_character(unencrypted_string)
    if next_position_and_character
      position, character = next_position_and_character

      unless locked_elements.include?(position)
        password[position] = character 
        locked_elements << position
      end
    end
    int += 1
  end
  
  return password.join("")
end

#puts build_password("abbhdwsy")
puts build_password_with_positions("abbhdwsy")
