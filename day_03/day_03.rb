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
  puts counter
end

read_lines

