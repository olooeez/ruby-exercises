require_relative '../lib/binary_search_trees'

require 'rspec'

describe BinarySearchTrees do
  let(:array) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  let(:bst) { BinarySearchTrees.new(array) }

  describe '#initialize' do
    it 'creates a new Binary Search Tree object' do
      expect(bst).to be_a(BinarySearchTrees)
    end

    it 'sorts and uniques the input array' do
      expect(bst.value).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it 'builds the tree' do
      expect(bst.root).to be_a(Node)
    end
  end

  describe '#insert' do
    it 'inserts a new value into the tree' do
      bst.insert(10)
      expect(bst.find(10).value).to eq(10)
    end
  end

  describe '#delete' do
    it 'deletes a value from the tree' do
      bst.delete(5)
      expect(bst.find(5)).to be_nil
    end
  end

  describe '#find' do
    it 'finds a value in the tree' do
      expect(bst.find(5).value).to eq(5)
    end
  end

  describe '#level_order' do
    it 'prints the tree in level order' do
      expect { bst.level_order }.to output('5 2 7 1 3 6 8 4 9 ').to_stdout
    end
  end

  describe '#preorder' do
    it 'prints the tree in preorder' do
      expect { bst.preorder }.to output('5 2 1 3 4 7 6 8 9 ').to_stdout
    end
  end

  describe '#inorder' do
    it 'prints the tree in inorder' do
      expect { bst.inorder }.to output('1 2 3 4 5 6 7 8 9 ').to_stdout
    end
  end

  describe '#postorder' do
    it 'prints the tree in postorder' do
      expect { bst.postorder }.to output('1 4 3 2 6 9 8 7 5 ').to_stdout
    end
  end

  describe '#height' do
    it 'returns the height of the tree' do
      expect(bst.height).to eq(3)
    end
  end

  describe '#depth' do
    it 'returns the depth of a node in the tree' do
      expect(bst.depth(5)).to eq(0)
    end
  end

  describe '#balanced?' do
    it 'returns true if the tree is balanced' do
      expect(bst.balanced?).to be true
    end
  end

  describe '#rebalance' do
    it 'rebalances the tree' do
      bst.insert(10)
      bst.insert(11)
      bst.rebalance
      expect(bst.balanced?).to be true
    end
  end
end
