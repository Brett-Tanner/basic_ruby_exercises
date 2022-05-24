# get string to be ciphered 
puts "Please enter the message you wish to convert"
input_string = gets.chomp

# check they're valid characters 
unless input_string.ascii_only?
    puts "Only ASCII characters are accepted"
    return
end

# get cipher key (check its an integer)
puts "What would you like to shift by?"
shift_key = gets.chomp.to_i

# convert the string to an array of ASCII values
ascii_array = []
input_string.each_codepoint { |char| ascii_array.push(char)}


# add (.map?) the cipher key to each ASCII code (TODO: while making sure to wrap if you go out of bounds)
shifted_ascii = ascii_array.map do |value|
    # only shift alphabetical characters
    if (value > 64 && value < 91) || (value > 96 && value < 123)
        value + shift_key
        # wrap around if you would change to a non-alphabetical character

    else
        value
    end
end

# convert back to chars
shifted_chars = shifted_ascii.map { |value| value.chr}

# join the array of chars to a string
shifted_string = shifted_chars.join

# put the resulting string
puts "Your ciphered message is #{shifted_string}"