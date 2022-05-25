# get the word you're searching in
puts "Input word to be searched"
word = gets.chomp

# get the array of substrings
puts "Input substrings to search for, separated by only a space"
substrings = gets.chomp
substring_array = substrings.split(" ") 

# check if each substring is included in the word
hash_of_matches = substring_array.reduce(Hash.new(0)) do |accumulator, value|
    word.scan(value) do |match|
        accumulator[match] += 1
    end
    accumulator
end

# output a hash that lists each subtring with a match and how many times it matched
p hash_of_matches