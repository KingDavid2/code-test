# frozen_string_literal: true

require_relative '../lib/load'

describe SpecialFullCoverageProduct do
  context 'Business validations' do
    describe '.next_day' do
      let(:product_1) { SpecialFullCoverageProduct.new('Special Full Coverage Product', 10, 10) }
      let(:product_2) { SpecialFullCoverageProduct.new('Special Full Coverage Product', 5, 10) }
      let(:product_3) { SpecialFullCoverageProduct.new('Special Full Coverage Product', 1, 10) }
      let(:product_4) { SpecialFullCoverageProduct.new('Special Full Coverage Product', 20, 10) }
      let(:product_5) { SpecialFullCoverageProduct.new('Special Full Coverage Product', 5, 44) }

      it 'Price increases by 2 when there are 10 days or less' do
        expect(product_1.next_day).to eq 'Special Full Coverage Product, 9, 12'
        expect(product_1.next_day).to eq 'Special Full Coverage Product, 8, 14'
        expect(product_1.next_day).to eq 'Special Full Coverage Product, 7, 16'
      end

      it 'Price increases by 3 when there are 5 days or less' do
        expect(product_2.next_day).to eq 'Special Full Coverage Product, 4, 13'
        expect(product_2.next_day).to eq 'Special Full Coverage Product, 3, 16'
        expect(product_2.next_day).to eq 'Special Full Coverage Product, 2, 19'
      end

      it 'Price drops to 0 when no more days lefts' do
        expect(product_3.next_day).to eq 'Special Full Coverage Product, 0, 13'
        expect(product_3.next_day).to eq 'Special Full Coverage Product, -1, 0'
        expect(product_3.next_day).to eq 'Special Full Coverage Product, -2, 0'
      end

      it 'Price increases by 1 when there are more than 10 days' do
        expect(product_4.next_day).to eq 'Special Full Coverage Product, 19, 11'
        expect(product_4.next_day).to eq 'Special Full Coverage Product, 18, 12'
        expect(product_4.next_day).to eq 'Special Full Coverage Product, 17, 13'
      end

      it 'The price of a product is never more than 50.' do
        expect(product_5.next_day).to eq 'Special Full Coverage Product, 4, 47'
        expect(product_5.next_day).to eq 'Special Full Coverage Product, 3, 50'
        expect(product_5.next_day).to eq 'Special Full Coverage Product, 2, 50'
      end
    end
  end
end
