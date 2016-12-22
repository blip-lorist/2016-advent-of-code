def real_room_sector_id(encrypted_name)
  letter_counter = Hash.new(0)

  given_checksum = encrypted_name.slice!(/\[.*?\]/)
  sector_id_index = encrypted_name.rindex("-") + 1

  sector_id = encrypted_name.slice!(sector_id_index..-1).to_i
  
  letters = encrypted_name.gsub("-","").split("")
  letters.each do |letter|
    letter_counter[letter] += 1
  end
  
  sorted_letters = letter_counter.sort_by { |key, value| [-value, key] } # descending order

  accurate_checksum = "["
  sorted_letters[0..4].each do |pair|
    letter, counter = pair
    accurate_checksum += letter
  end

  accurate_checksum += "]"

  if accurate_checksum == given_checksum
    # Side effect - generate list of real encrypted names
    # puts encrypted_name + sector_id.to_s
    return sector_id 
  else 
    return 0
  end
end

def add_sector_ids
  sum = 0
  File.open("encrypted_names.txt").each do |line|
    sum += real_room_sector_id(line)
  end

  return sum
end

def rotate(characters, count)

  characters = characters.split("")
  rotated_characters = []
  lowercase = ("a".."z").to_a
  uppercase = ("A".."Z").to_a


  characters.each do |character| 
    if character == "-" || character == " "
      range = ["-", " "] 
      modulus = 2
    elsif lowercase.include?(character) 
      range = lowercase
      modulus = 26
    else 
      range = uppercase
      modulus = 26
    end

    character_index = range.find_index(character)
    rotated_character_index = (character_index + count) % modulus
    rotated_character = range[rotated_character_index]

    rotated_characters << rotated_character
  end

  return rotated_characters.join("")
end

def decrypt_rotated_real_names
  File.open("real_encrypted_names.txt").each do |line|
    sector_id_index = line.rindex("-") + 1
    sector_id = line.slice!(sector_id_index..-1).to_i

    puts rotate(line, sector_id) + sector_id.to_s
  end
end

#puts add_sector_ids


decrypt_rotated_real_names
