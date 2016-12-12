def possible_triangle?(sides)
  sides.permutation(3).to_a.each do |permutation|
    a, b, c = permutation 
    unless a + b > c
      return false
    end
  end

  return true 
end

def read_lines
  counter = 0
  File.open("./graphic_design_triangles.txt").each do |line|
    sides = line.split(" ")
    sides = sides.map(&:to_i)
    if possible_triangle?(sides)
      counter += 1
    end
  end
  return counter
end

def read_columns
  # memory suck edition
  col_1 = []
  col_2 = []
  col_3 = []
  File.open("./graphic_design_triangles.txt").each do |line|
    sides = line.split(" ")
    sides = sides.map(&:to_i)
    col_1 << sides[0]
    col_2 << sides[1]
    col_3 << sides[2]
  end
  
  counter = 0
  [col_1, col_2, col_3].each do |column|
    column.each_slice(3) do |x, y, z|
      if possible_triangle?([x, y, z])
        counter += 1
      end
    end
  end
  return counter
end

puts "First answer: #{read_lines}"
puts "Second answer: #{read_columns}"

