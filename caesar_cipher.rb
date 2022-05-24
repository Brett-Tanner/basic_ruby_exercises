# get string to be ciphered 
puts "Please enter the message you wish to convert"
input_string = gets.chomp

unless input_string.ascii_only?
    puts "Only ASCII characters are accepted"
    return 1
end

# get cipher key (check its an integer)
puts "What would you like to shift by?"
shift_key = gets.chomp

# turn the string into an array of chars FIXME: just turns them into 0s
char_array = input_string.chars

puts char_array

# convert each char to its ASCII code
ascii_array = char_array.map { |element| element.to_i}

puts ascii_array

# add (.map?) the cipher key to each ASCII code (while making sure to wrap if you go out of bounds, also preserve case)

# convert back to chars

# join the array of chars to a string

# put the resulting string