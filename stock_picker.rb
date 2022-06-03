# get the stock prices
puts "Enter daily stock prices, separated by a space"
prices_array = gets.chomp.split(" ").map { |value| value.to_f} 

# check everything is a number
unless prices_array.all? { |value| value.positive?}
    puts "Prices must be numbers greater than 0"
    return
end


# find the largest diff between numbers FIXME: some logic errors maybe? Also if there are two equal profits it store the latest, makes more sense to store earliest
# FIXME: also why are we returning a float for the price?
# array to store best sale dates (index is the purchase date)
best_dates = []
prices_array.each_with_index do |purchase_price, index|
    # allows me to get original prices_array indexes while working with shortened array
    offset = index + 1
    # shorten the array so you don't try to sell before you buy
    shortened_array = prices_array.drop(offset)
    p shortened_array
    # store index of day to be sold and profit 
    profit_sell = [index, 0, 0]
    shortened_array.each_with_index do |sale_price, index2|
        profit = sale_price - purchase_price
        if profit > profit_sell[1]
            profit_sell[1] = index2 + offset
            profit_sell[2] = profit
            p profit_sell
        end
    end
    best_dates.push(profit_sell)
    p best_dates
end


# output an array representing the optimal buying/selling days
max_profit = best_dates.reduce do |accumulator, comparison|
    if comparison[2] > accumulator[2]
        comparison
    else
        accumulator
    end
end

puts "You should buy on day #{max_profit[0]} and sell on day #{max_profit[1]} for a profit of $#{max_profit[2]}"