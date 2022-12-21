# frozen_string_literal: true

require './lib/stock_picker'

RSpec.describe 'Stock Picker' do
  describe '#stock_picker' do
    it 'Must return [1, 4]' do
      expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
    end
  end
end
