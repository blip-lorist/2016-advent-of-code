STARTING_POSITION= "3-1"
KEYPAD = 
  {
    "1-1":"0", "1-2":"0", "1-3":"1", "1-4":"0", "1-5":"0",
    "2-1":"0", "2-2":"2", "2-3":"3", "2-4":"4", "2-5":"0",
    "3-1":"5", "3-2":"6", "3-3":"7", "3-4":"8", "3-5":"9",
    "4-1":"0", "4-2":"A", "4-3":"B", "4-4":"C", "4-5":"0",
    "5-1":"0", "5-2":"0", "5-3":"D", "5-4":"0", "5-5":"0",
  }

def move(current_point, direction)
  current_row = current_point[0].to_i
  current_column = current_point[2].to_i
  case direction
  when "R"
    lookahead_position = current_row.to_s + "-" + (current_column + 1).to_s
    unless KEYPAD[lookahead_position.to_sym] == "0" || current_column == 5
      current_column += 1
      current_point = current_row.to_s + "-" + current_column.to_s 
    end
    return current_point
  when "L"
    lookahead_position = current_row.to_s + "-" + (current_column - 1).to_s
    unless KEYPAD[lookahead_position.to_sym] == "0" || current_column == 1
      current_column -= 1
      current_point = current_row.to_s + "-" + current_column.to_s 
    end
    return current_point
  when "U"
    lookahead_position = (current_row - 1).to_s + "-" + current_column.to_s
    unless KEYPAD[lookahead_position.to_sym] == "0" || current_row == 1
      current_row -= 1
      current_point = current_row.to_s + "-" + current_column.to_s 
    end
    return current_point
  when "D"
    lookahead_position = (current_row + 1).to_s + "-" + current_column.to_s
    unless KEYPAD[lookahead_position.to_sym] == "0" || current_row == 5
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

#Small test
# first_digit = process_line("ULL", STARTING_POSITION)
# second_digit = process_line("RRDDD", first_digit)
# third_digit = process_line("LURDL", second_digit)
# fourth_digit = process_line("UUUUD", third_digit)

File.open("bathroom_code.txt").each do |line|
  line = line.strip
  digit_position = STARTING_POSITION
  digit_position = process_line(line, digit_position)
end
