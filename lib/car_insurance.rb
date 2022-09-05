# frozen_string_literal: true

# Car Insurance class
class CarInsurance
  attr_reader :products, :days

  def initialize(products = [], days = 0)
    @products = products
    @days = days
  end

  def initial_state
    puts '-------- day 0 --------'
    puts 'name, sellIn, price'
    products.each do |product|
      puts product.show
    end
  end

  def update_price
    initial_state
    days.times do |day|
      puts "-------- day #{day + 1} --------"
      puts 'name, sellIn, price'
      products.each do |product|
        puts product.next_day
      end
      puts ''
    end
  end
end
