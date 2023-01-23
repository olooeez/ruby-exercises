require_relative '../lib/merge_sort'

require 'rspec'

describe '#merge_sort' do
  it 'sorts an array using the merge sort algorithm' do
    expect(merge_sort([5, 3, 8, 1, 2])).to eq([1, 2, 3, 5, 8])
    expect(merge_sort([5, 3, 8, 1, 2, 7, 10, 4])).to eq([1, 2, 3, 4, 5, 7, 8, 10])
    expect(merge_sort([5, 3, 8, 1, 2, 0])).to eq([0, 1, 2, 3, 5, 8])
  end
end

describe '#merge' do
  it 'merges two sorted arrays into one sorted array' do
    expect(merge([1, 3, 5], [2, 4, 6], [])).to eq([1, 2, 3, 4, 5, 6])
    expect(merge([1, 3, 5, 7], [2, 4, 6], [])).to eq([1, 2, 3, 4, 5, 6, 7])
  end
end
