class StockPicker

  def stock_picker(daily_prices)
    @best_price_spread = 0
    @buy_on = 0
    @sell_on = 0
    first = 1
    last = daily_prices.length - 1
    loop_again = true
    while loop_again
      daily_prices[0, last].each_with_index do |price_1, index_1|
        daily_prices[first, last].each_with_index do |price_2, index_2|
          if price_1 > price_2 && (price_1 - price_2) > @best_price_spread
            @best_price_spread = price_1 - price_2

          end
        end
      end
    end
  end
end