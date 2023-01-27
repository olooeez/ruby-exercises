require_relative '../lib/knight'

require 'rspec'

describe Knight do
  let(:knight) { Knight.new([3, 3]) }

  describe '#initialize' do
    it 'sets the location to the given coordinates' do
      expect(knight.location).to eq([3, 3])
    end

    it 'sets the moves to the possible moves from the given coordinates' do
      expect(knight.moves).to include([2, 1], [4, 1], [2, 5], [4, 5], [1, 2], [5, 2], [1, 4], [5, 4])
    end

    it 'sets the children to an empty array' do
      expect(knight.children).to eq([])
    end
  end

  describe '#possible_moves' do
    it 'returns all possible moves from the given location' do
      expect(knight.possible_moves([3, 3])).to include([2, 1], [4, 1], [2, 5], [4, 5], [1, 2], [5, 2], [1, 4], [5, 4])
    end
  end
end
