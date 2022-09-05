# frozen_string_literal: true

require_relative '../lib/load'

describe MegaCoverageProduct do
  context 'Business validations' do
    describe '.next_day' do
      let(:product_1) { MegaCoverageProduct.new('Mega Coverage Product', 3, 8) }
      let(:product_2) { MegaCoverageProduct.new('Mega Coverage Product', 1, 6) }
      let(:product_3) { MegaCoverageProduct.new('Mega Coverage Product', -1, 3) }

      it 'Never has to be sold or decreases in price' do
        expect(product_1.next_day).to eq 'Mega Coverage Product, 3, 8'
        expect(product_2.next_day).to eq 'Mega Coverage Product, 1, 6'
        expect(product_3.next_day).to eq 'Mega Coverage Product, -1, 3'
      end
    end
  end
end
