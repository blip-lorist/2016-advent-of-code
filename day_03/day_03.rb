def possible_triangle?(sides)
  sides.combination(3).detect do |a, b, c|
    if a + b > c
      return true
    end
  end
  return false
end

