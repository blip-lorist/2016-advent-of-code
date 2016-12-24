def get_columns(file)
  column_map = Hash.new("")
  File.open(file).each do |line|
    line_array = line.strip.split("")

    line_array.each_with_index do |character, index| 
      column_map[index] += character
    end
  end
  return column_map
end

def get_common_characters(file)
  columns_hash = get_columns(file) 

  columns_hash.each do |key, value| 
    frequency = Hash.new(0)
    characters = value.split("")
    characters.each do |character| 
      frequency[character] += 1
    end
    puts frequency.key(frequency.values.min)
  end
end

get_common_characters("./puzzle_input.txt")

