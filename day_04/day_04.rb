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

puts add_sector_ids

