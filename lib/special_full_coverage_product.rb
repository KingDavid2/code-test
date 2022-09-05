# frozen_string_literal: true

# Supecial Full Product class, initialize name and price
class SpecialFullCoverageProduct < FullCoverageProduct
  def price_change
    if @sell_in <= 5
      3
    elsif @sell_in <= 10
      2
    else
      1
    end
  end

  def new_price
    super
    @price = 0 if @sell_in.negative?
  end
end
