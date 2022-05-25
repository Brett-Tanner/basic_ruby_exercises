# get the word you're searching in
puts "Input word to be searched"
word = gets.chomp

# get the array of substrings
puts "Input substrings to search for, separated by only a space"
substrings = gets.chomp
substring_array = substrings.split(" ") 

# check if there's a match between the word and each substring



# count the number of matches for each substring (.include?)?

# output a hash that lists each subtring with a match and how many times it matched