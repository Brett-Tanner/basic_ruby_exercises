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

# define recursive method for swapping and tracking number of swaps made 
def sort_array array
    num_of_swaps = 0
    array_length = array.length
    array.each_with_index do |value, index|
        if index >= array_length - 1
            break
        end
        next_index = index + 1
        next_value = array[next_index]
        if value > next_value
            temp = next_value
            array[next_index] = value
            array[index] = temp
            num_of_swaps += 1 
        end
    end
    if num_of_swaps > 0
        num_of_swaps = 0
        sort_array(array)
    end
    array
end

# call method on the array
sorted_array = sort_array(input_array)
p sorted_array