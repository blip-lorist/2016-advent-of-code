input_array=["R3","L5","R2","L2","R1","L3","R1","R3","L4","R3","L1","L1","R1","L3","R2","L3","L2","R1","R1","L1","R4","L1","L4","R3","L2","L2","R1","L1","R5","R4","R2","L5","L2","R5","R5","L2","R3","R1","R1","L3","R1","L4","L4","L190","L5","L2","R4","L5","R4","R5","L4","R1","R2","L5","R50","L2","R1","R73","R1","L2","R191","R2","L4","R1","L5","L5","R5","L3","L5","L4","R4","R5","L4","R4","R4","R5","L2","L5","R3","L4","L4","L5","R2","R2","R2","R4","L3","R4","R5","L3","R5","L2","R3","L1","R2","R2","L3","L1","R5","L3","L5","R2","R4","R1","L1","L5","R3","R2","L3","L4","L5","L1","R3","L5","L2","R2","L3","L4","L1","R1","R4","R2","R2","R4","R2","R2","L3","L3","L4","R4","L4","L4","R1","L4","L4","R1","L2","R5","R2","R3","R3","L2","L5","R3","L3","R5","L2","R3","R2","L4","L3","L1","R2","L2","L3","L5","R3","L1","L3","L4","L3"]

def facing?(starting_direction, new_direction)
    if starting_direction == "N"
        if new_direction == "R"
            "E"
        elsif new_direction == "L"
            "W"
        end
    elsif starting_direction == "S"
        if new_direction == "R"
            "W"
        elsif new_direction == "L"
            "E"
        end
    elsif starting_direction == "E"
        if new_direction == "R"
            "S"
        elsif new_direction == "L"
            "N"
        end
    else # W 
        if new_direction == "R"
            "N"
        elsif new_direction == "L"
            "S"
        end
    end
end

def increment_counter(block_counter, facing_direction, distance)
    if facing_direction == "N"
        block_counter["y-axis"] += distance.to_i
    elsif facing_direction == "S"
        block_counter["y-axis"] -= distance.to_i
    elsif facing_direction == "E"
        block_counter["x-axis"] += distance.to_i
    elsif facing_direction == "W"
        block_counter["x-axis"] -= distance.to_i
    end
end

def previous_visit(seen, block_counter)
    log_key = "x-axis#{block_counter["x-axis"]}y-axis#{block_counter["y-axis"]}" 
    if seen.has_key?(log_key) 
        return log_key
    else 
        seen[log_key] = 0
        return nil
    end
end

def record_steps(seen, block_counter, facing_direction)
    increment_counter(block_counter, facing_direction, 1)
    duplicate_location = previous_visit(seen, block_counter)
    if duplicate_location
      puts "Second answer: #{measure_blocks(block_counter)}"
      exit
    end
end

def measure_blocks(block_counter)
    block_counter["x-axis"].abs + block_counter["y-axis"].abs
end

def answer(input_array,options={})

    block_counter = Hash.new(0)
    seen = {} 

    facing_direction = "N"
    input_array.each do |input|
      input_clone = input.clone
      new_direction = input_clone.slice!(0)
        distance = input_clone.to_i
        facing_direction = facing?(facing_direction, new_direction)

        if options[:first_visited]
          distance.times do 
            record_steps(seen, block_counter, facing_direction)
          end
        else 
            increment_counter(block_counter, facing_direction, distance)
        end
    end

    measure_blocks(block_counter)
end

puts "First answer: #{answer(input_array)}"
answer(input_array, {:first_visited => true})

