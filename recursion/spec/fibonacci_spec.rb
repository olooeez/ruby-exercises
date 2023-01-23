require_relative '../lib/fibonacci'

require 'rspec'

describe '#fibs' do
  it 'calculates the fibonacci sequence' do
    expect(fibs(5)).to eq([0, 1, 1, 2, 3, 5])
    expect(fibs(8)).to eq([0, 1, 1, 2, 3, 5, 8, 13, 21])
  end
end

describe '#fibs_rec' do
  it 'calculates the fibonacci sequence using recursion' do
    expect(fibs_rec(5)).to eq([0, 1, 1, 2, 3, 5])
    expect(fibs_rec(8)).to eq([0, 1, 1, 2, 3, 5, 8, 13, 21])
  end
end
