# frozen_string_literal: true

require_relative '../lib/load'
require 'pry'
require 'json'

describe CarInsurance do
  let(:initial_state) do
    [
      Product.new('Medium Coverage', 10, 20),
      Product.new('Full Coverage', 2, 0),
      Product.new('Low Coverage', 5, 7),
      Product.new('Mega Coverage', 0, 80),
      Product.new('Mega Coverage', -1, 80),
      Product.new('Special Full Coverage', 15, 20),
      Product.new('Special Full Coverage', 10, 49),
      Product.new('Special Full Coverage', 5, 49),
      Product.new('Super Sale', 3, 6)
    ]
  end

  let(:end_state) do
    [
      Product.new('Medium Coverage', -20, 0),
      Product.new('Full Coverage', -28, 50),
      Product.new('Low Coverage', -25, 0),
      Product.new('Mega Coverage', 0, 80),
      Product.new('Mega Coverage', -1, 80),
      Product.new('Special Full Coverage', -15, 0),
      Product.new('Special Full Coverage', -20, 0),
      Product.new('Special Full Coverage', -25, 0),
      Product.new('Super Sale', -27, 0)
    ]
  end
  context 'With products and days' do
    let(:car_insurance) { CarInsurance.new initial_state, 30 }

    it 'Should display the coverage report' do
      car_insurance.update_price

      car_insurance.products.each.with_index do |product, index|
        product.tap do |_p|
          expect(product.name).to eq end_state[index].name
          expect(product.sell_in).to eq end_state[index].sell_in
          expect(product.price).to eq end_state[index].price
        end
      end
    end
  end
end
