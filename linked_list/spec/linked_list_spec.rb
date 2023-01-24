require_relative '../lib/linked_list'

require 'rspec'

describe LinkedList do
  let(:linked_list) { LinkedList.new }

  describe '#append' do
    it 'adds a new node to the end of the list' do
      linked_list.append(1)
      linked_list.append(2)
      expect(linked_list.tail.value).to eq(2)
    end
  end

  describe '#prepend' do
    it 'adds a new node to the start of the list' do
      linked_list.prepend(1)
      linked_list.prepend(2)
      expect(linked_list.head.value).to eq(2)
    end
  end

  describe '#size' do
    it 'returns the number of nodes in the list' do
      linked_list.append(1)
      linked_list.append(2)
      linked_list.append(3)
      expect(linked_list.size).to eq(3)
    end
  end

  describe '#tail' do
    it 'returns the last node in the list' do
      linked_list.append(1)
      linked_list.append(2)
      linked_list.append(3)
      expect(linked_list.tail.value).to eq(3)
    end
  end

  describe '#at' do
    it 'returns the node at the given index' do
      linked_list.append(1)
      linked_list.append(2)
      linked_list.append(3)
      expect(linked_list.at(1).value).to eq(2)
    end
  end

  describe '#pop' do
    it 'removes and returns the last node in the list' do
      linked_list.append(1)
      linked_list.append(2)
      linked_list.append(3)
      expect(linked_list.pop.value).to eq(3)
    end
  end

  describe '#contains?' do
    it 'returns true if the list contains the given value' do
      linked_list.append(1)
      linked_list.append(2)
      linked_list.append(3)
      expect(linked_list.contains?(2)).to be true
    end

    it 'returns false if the list does not contain the given value' do
      linked_list.append(1)
      linked_list.append(2)
      linked_list.append(3)
      expect(linked_list.contains?(4)).to be false
    end
  end

  describe '#find' do
    it 'returns the index of the node containing the given value' do
      linked_list.append(1)
      linked_list.append(2)
      linked_list.append(3)
      expect(linked_list.find(2)).to eq(1)
    end

    it 'returns nil if the value is not found' do
      linked_list.append(1)
      linked_list.append(2)
      linked_list.append(3)
      expect(linked_list.find(4)).to be_nil
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the list' do
      linked_list.append(1)
      linked_list.append(2)
      linked_list.append(3)
      expect(linked_list.to_s).to eq('(1) -> (2) -> (3) -> nil')
    end
  end
end
