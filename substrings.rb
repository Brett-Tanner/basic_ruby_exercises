# get the word you're searching in
puts "Input word to be searched"
word = gets.chomp

# get the array of substrings
puts "Input substrings to search for, separated by only a space"
substrings = gets.chomp
substring_array = substrings.split(" ") 

# check if there's a match between the word and each substring (reduce)? and count the number of matches for each substring (.include?)? FIXME: converting string to an int here?
hash_of_matches = substring_array.reduce(Hash.new{0}) do |accumulator, value|
    if word.include?(value)
        accumulator[value] += 1
    end
end

# output a hash that lists each subtring with a match and how many times it matched
p hash_of_matches