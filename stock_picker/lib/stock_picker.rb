# frozen_string_literal: true

def stock_picker(stocks)
  min_price = stocks[0]
  min_day = 0
  profit = 0
  days = [min_day, 0]

  stocks.each_with_index do |price, day|
    if min_price > price
      min_price = price
      min_day = day
      next
    end

    if price - min_price > profit
      profit = price - min_price
      days = [min_day, day]
    end
  end

  days
end
