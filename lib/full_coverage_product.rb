# frozen_string_literal: true

# Full Coverage Product class, initialize name and price
class FullCoverageProduct < DefaultProduct
  validates :price, numericality: { less_than_or_equal_to: 50 }

  def price_change
    @sell_in >= 0 ? 1 : 2
  end

  def new_price
    price = @price + price_change
    @price = price <= 50 ? price : 50
  end
end
