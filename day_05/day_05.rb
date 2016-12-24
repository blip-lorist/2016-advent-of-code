require 'digest/md5'

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

def build_password(door_id, int=1, password=[])
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

puts build_password("abbhdwsy")

