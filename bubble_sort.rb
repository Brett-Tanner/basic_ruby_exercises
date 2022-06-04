# take an array as input
puts "Enter numbers to be sorted, separated by a space"
input_array = gets.chomp.split(" ") 

# check inputs are numeric
unless input_array.all? {|value| Float(value) rescue false}
    puts "Only numbers can be sorted"
    return
end

# convert the input values from strings to floats
input_array.map! {|value| value.to_f}

# compare two values and swap them if right is smaller
# track number of swaps made
num_of_swaps = 0
sorted_array = input_array.each_with_index do |value, index|
    next_value = input_array[index + 1]
    if value > next_value
        temp = next_value
        next_value = value
        value = temp
        num_of_swaps++ 
    end
    
end


# check if the array is sorted??



# if not sorted run again