# frozen_string_literal: true

require_relative '../lib/load'
require 'pry'

describe DefaultProduct do
  context 'Basic validations' do
    let(:valid_product) { DefaultProduct.new('Full Coverage', 10, 20) }
    let(:product_name_blank) { DefaultProduct.new(nil, 10, 20) }
    let(:product_sell_in_blank) { DefaultProduct.new('Full Coverage', nil, 20) }
    let(:product_sell_in_negative) { DefaultProduct.new('Full Coverage', 10, -1) }
    let(:product_price_blank) { DefaultProduct.new('Full Coverage', 10, nil) }

    it 'With valid product' do
      expect(valid_product.valid?).to eq true
      expect(valid_product.errors.empty?).to eq true
    end

    describe 'With name' do
      it 'can\'t be blank' do
        expect(product_name_blank.valid?).to eq false
        expect(product_name_blank.errors.full_messages.to_s).to include "Name can't be blank"
      end
    end

    it 'sell in can\'t blank' do
      expect(product_sell_in_blank.valid?).to eq false
      expect(product_sell_in_blank.errors.full_messages.to_s).to include "Sell in can't be blank"
    end

    describe 'With price' do
      it 'can\'t be blank' do
        expect(product_price_blank.valid?).to eq false
        expect(product_price_blank.errors.full_messages.to_s).to include "Price can't be blank"
      end

      it 'should be positive' do
        expect(product_sell_in_negative.valid?).to eq false
        expect(product_sell_in_negative.errors.full_messages.to_s).to include 'Price must be greater than or equal to 0'
      end
    end
  end

  context 'Business validations' do
    describe '.next_day' do
      let(:product_1) { DefaultProduct.new('Default Product', 3, 8) }
      let(:product_2) { DefaultProduct.new('Default Product', 1, 6) }
      let(:product_3) { DefaultProduct.new('Default Product', -1, 3) }

      it 'Each day should decrease sell in days and price by one' do
        expect(product_1.next_day).to eq 'Default Product, 2, 7'
        expect(product_1.next_day).to eq 'Default Product, 1, 6'
        expect(product_1.next_day).to eq 'Default Product, 0, 5'
      end

      it 'Once the sell by date has passed, price degrades twice as fast' do
        expect(product_2.next_day).to eq 'Default Product, 0, 5'
        expect(product_2.next_day).to eq 'Default Product, -1, 3'
        expect(product_2.next_day).to eq 'Default Product, -2, 1'
      end

      it 'The price of a product is never negative.' do
        expect(product_3.next_day).to eq 'Default Product, -2, 1'
        expect(product_3.next_day).to eq 'Default Product, -3, 0'
        expect(product_3.next_day).to eq 'Default Product, -4, 0'
      end
    end
  end
end
