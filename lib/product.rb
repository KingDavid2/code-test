# frozen_string_literal: true

# Factory Product class, initialize name and price
class Product
  include ActiveSupport::Inflector

  class << self
    def new(name, sell_in, price)
      begin
        "#{name.delete(' ')}Product".constantize.new(name, sell_in, price)
      rescue
        DefaultProduct.new(name, sell_in, price)
      end
    end
  end
end
