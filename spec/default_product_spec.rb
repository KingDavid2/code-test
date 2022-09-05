# frozen_string_literal: true

require_relative '../lib/load'
require 'pry'

describe DefaultProduct do
  let(:valid_product) { DefaultProduct.new('Full Coverage', 10, 20) }
  let(:product_name_blank) { DefaultProduct.new(nil, 10, 20) }
  let(:product_sell_in_blank) { DefaultProduct.new('Full Coverage', nil, 20) }
  let(:product_sell_in_negative) { DefaultProduct.new('Full Coverage', 10, -1) }
  let(:product_price_blank) { DefaultProduct.new('Full Coverage', 10, nil) }
  # let(:product_name_not_found) { DefaultProduct.new('Any Name', 10, 20) }

  context 'Basic validations' do
    it 'With valid product' do
      expect(valid_product.valid?).to eq true
      expect(valid_product.errors.empty?).to eq true
    end

    describe 'With name' do
      it 'can\'t be blank' do
        expect(product_name_blank.valid?).to eq false
        expect(product_name_blank.errors.full_messages.to_s).to include "Name can't be blank"
      end

      # it 'should exists' do
      #   expect(product_name_not_found.valid?).to eq false
      #   expect(product_name_not_found.errors.full_messages.to_s).to include 'DefaultProduct name not found'
      # end
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
end
