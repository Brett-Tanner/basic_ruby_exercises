# take an array as input
puts "Enter numbers to be sorted, separated by a space"
input_array = gets.chomp.split(" ") 

# check inputs are numbers
unless input_array.all? {|value| Float(value) rescue false}
    puts "Only numbers can be sorted"
    return
end

# convert the input values to numbers
input_array.map! {|value| value.to_f}

# compare two values and swap them if right is smaller

# check if the array is sorted??

# if not sorted run again