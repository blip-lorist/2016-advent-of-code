STARTING_POSITION= "2-2"

KEYPAD = 
  {
    "1-1":1, "1-2":2, "1-3":3,
    "2-1":4, "2-2":5, "2-3":6,
    "3-1":7, "3-2":8, "3-3":9
  }

def move(current_point, direction)
  current_row = current_point[0].to_i
  current_column = current_point[2].to_i

  case direction
  when "R"
    if current_column < 3
      current_column += 1
      current_point = current_row.to_s + "-" + current_column.to_s 
    end
      return current_point
  when "L"
    if current_column > 1
      current_column -= 1
      current_point = current_row.to_s + "-" + current_column.to_s 
    end
      return current_point
  when "U"
    if current_row > 1
      current_row -= 1
      current_point = current_row.to_s + "-" + current_column.to_s 
    end
      return current_point
  when "D"
    if current_row < 3
      current_row += 1
      current_point = current_row.to_s + "-" + current_column.to_s 
    end
      return current_point
  else 
    return current_point
  end
end 

def process_line(line, starting_position)
  digit_position = starting_position 

  directions = line.split("")
  directions.each do |direction|
    digit_position = move(digit_position, direction)
  end

  puts KEYPAD[digit_position.to_sym]
  return digit_position
end

first_digit = process_line("ULL", STARTING_POSITION)
second_digit = process_line("RRDDD", first_digit)
third_digit = process_line("LURDL", second_digit)
fourth_digit = process_line("UUUUD", third_digit)
