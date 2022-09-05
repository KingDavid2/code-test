# frozen_string_literal: true

# Default Product class, initialize name and price
class DefaultProduct
  include ActiveModel::Model
  include ActiveSupport::Inflector

  attr_reader :name, :sell_in, :price

  validates :name, :sell_in, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def initialize(name, sell_in, price)
    @name = name
    @sell_in = sell_in
    @price = price
  end

  def sell_in_change
    -1
  end

  def price_change
    @sell_in >= 0 ? -1 : -2
  end

  def new_sell_in
    @sell_in += sell_in_change
  end

  def new_price
    price = @price + price_change
    @price = price >= 0 ? price : 0
  end

  def show
    "#{name}, #{sell_in}, #{price}"
  end

  def next_day
    new_sell_in
    new_price
    show
  end
end
