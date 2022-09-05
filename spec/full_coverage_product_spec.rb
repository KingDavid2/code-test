# frozen_string_literal: true

require_relative '../lib/load'

describe FullCoverageProduct do
  context 'Business validations' do
    describe '.next_day' do
      let(:product_1) { FullCoverageProduct.new('Full Coverage Product', 3, 0) }
      let(:product_2) { FullCoverageProduct.new('Full Coverage Product', 1, 0) }
      let(:product_3) { FullCoverageProduct.new('Full Coverage Product', 2, 48) }

      it 'Each day should decrease sell in days by one and price increase by 1 until day 0' do
        expect(product_1.next_day).to eq 'Full Coverage Product, 2, 1'
        expect(product_1.next_day).to eq 'Full Coverage Product, 1, 2'
        expect(product_1.next_day).to eq 'Full Coverage Product, 0, 3'
      end

      it 'Once the sell by date has passed, price increase twice as fast' do
        expect(product_2.next_day).to eq 'Full Coverage Product, 0, 1'
        expect(product_2.next_day).to eq 'Full Coverage Product, -1, 3'
        expect(product_2.next_day).to eq 'Full Coverage Product, -2, 5'
      end

      it 'The price of a product is never more than 50.' do
        expect(product_3.next_day).to eq 'Full Coverage Product, 1, 49'
        expect(product_3.next_day).to eq 'Full Coverage Product, 0, 50'
        expect(product_3.next_day).to eq 'Full Coverage Product, -1, 50'
      end
    end
  end
end
