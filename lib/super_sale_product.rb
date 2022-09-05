# frozen_string_literal: true

# Super Sale Product class, initialize name and price
class SuperSaleProduct < DefaultProduct
  def price_change
    super * 2
  end
end
