# frozen_string_literal: true

# Default Product class, initialize name and price
class DefaultProduct
  include ActiveModel::Model
  include ActiveSupport::Inflector

  SELL_IN_CHANGE = -1
  PRICE_CHANGE = -1

  attr_accessor :name, :sell_in, :price

  validates :name, :sell_in, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def initialize(name, sell_in, price)
    @name = name
    @sell_in = sell_in
    @price = price
  end
end
