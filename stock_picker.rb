# get the stock prices
puts "Enter daily stock prices, separated by a space"
prices_array = gets.chomp.split(" ").map { |value| value.to_f} 

# check everything is a number
unless prices_array.all? { |value| value.positive?}
    puts "Prices must be numbers greater than 0"
    return
end

# compare each value to each value after it to determine which pair produces the greatest profit (ensures buying happens first)



# output an array representing the optimal buying/selling days
# p optimal_days