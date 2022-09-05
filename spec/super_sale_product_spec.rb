# frozen_string_literal: true

require_relative '../lib/load'
require 'pry'

describe SuperSaleProduct do
  context 'Business validations' do
    describe '.next_day' do
      let(:product_1) { SuperSaleProduct.new('Super Sale Product', 3, 8) }
      let(:product_2) { SuperSaleProduct.new('Super Sale Product', 1, 10) }
      let(:product_3) { SuperSaleProduct.new('Super Sale Product', -1, 3) }

      it 'Each day should decrease price by 2' do
        expect(product_1.next_day).to eq 'Super Sale Product, 2, 6'
        expect(product_1.next_day).to eq 'Super Sale Product, 1, 4'
        expect(product_1.next_day).to eq 'Super Sale Product, 0, 2'
      end

      it 'Once the sell by date has passed, price degrades by 4' do
        expect(product_2.next_day).to eq 'Super Sale Product, 0, 8'
        expect(product_2.next_day).to eq 'Super Sale Product, -1, 4'
        expect(product_2.next_day).to eq 'Super Sale Product, -2, 0'
      end

      it 'The price of a product is never negative.' do
        expect(product_3.next_day).to eq 'Super Sale Product, -2, 0'
        expect(product_3.next_day).to eq 'Super Sale Product, -3, 0'
        expect(product_3.next_day).to eq 'Super Sale Product, -4, 0'
      end
    end
  end
end
