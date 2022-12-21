# frozen_string_literal: true

require './lib/bubble_sort'

RSpec.describe 'Bubble Sort' do
  describe '#bubble_sort' do
    it 'Must return [0, 2, 2, 3, 4, 78]' do
      expect(bubble_sort([4, 3, 78, 2, 0, 2])).to eq([0, 2, 2, 3, 4, 78])
    end
  end
end
