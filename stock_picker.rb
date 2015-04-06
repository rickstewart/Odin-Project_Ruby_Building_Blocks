class StockPicker

  def stock_picker(daily_prices)
    @best_price_spread = 0
    start = 1
    last = daily_prices.length - 1
    daily_prices.each_with_index do |price_1, index_1|
      daily_prices[start, last].each_with_index do |price_2, index_2|
        if price_2 - price_1 > @best_price_spread
          @best_price_spread = price_2 - price_1
          @buy_on = index_1
          @sell_on = index_2 + start
        end
      end
      start = start + 1
    end
  end

  def display_results
    if @best_price_spread == 0
      puts "Sorry, there were no buying opportunities this time round. \n \n"
    else
      puts "For maximum profit, buy on #{@buy_on} and then sell on #{@sell_on}."
      puts "Your profit was #{@best_price_spread} \n \n"
    end
  end
end

tests = StockPicker.new
tests.stock_picker([17,3,6,9,15,8,6,1,10])
tests.display_results
tests.stock_picker([1,3,6,10,17,22])
tests.display_results
tests.stock_picker([10,9,8,7,6,5,4,3,2])
tests.display_results
tests.stock_picker([18,9,8,12,6,5,14,3,2])
tests.display_results