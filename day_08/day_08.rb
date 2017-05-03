def start_display(width, height)
  display = Hash.new()
  (0..width-1).each do |x_axis|
    (0..height-1).each do |y_axis|
      key = x_axis.to_s + "-" + y_axis.to_s
      display[key] = 0
    end
  end
  
  return display 
end

def print_display(hsh,width,height)
  # 0-2 1-2 2-2 
  # 0-1 1-1 2-1 
  # 0-0 1-0 2-0       
  
  max_y_axis = height-1

  max_y_axis.downto(0).each do |y_axis|
    row = {}
    hsh.each do |key, value|
      if key.include?("-#{y_axis}")
        row[key] = value
      end
    end

    sorted_values = []
    row.keys.sort.each do |sorted_key|
      sorted_values << row[sorted_key]
    end

    puts sorted_values.inspect
  end
end

print_display(start_display(7,3),7,3)
