class Node
  attr_accessor :left, :right, :value

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end

class BinarySearchTrees
  attr_accessor :root, :value

  def initialize(array = nil)
    @value = array.sort.uniq
    @root = build_tree(value)
  end

  def build_tree(array)
    return nil if array.empty?

    middle = (array.size - 1) / 2
    root_node = Node.new(array[middle])
    root_node.left = build_tree(array[0...middle])
    root_node.right = build_tree(array[(middle + 1)..])
    root_node
  end

  def insert(value, node = root)
    return nil if value == node.value

    if value < node.value
      node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
    else
      node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
    end
  end

  def delete(value, node = root)
    return node if node.nil?

    if value < node.value
      node.left = delete(value, node.left)
    elsif value > node.value
      node.right = delete(value, node.right)
    else
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      leftmost_node = leftmost_leaf(node.right)
      node.value = leftmost_node.value
      node.right = delete(leftmost_node.value, node.right)
    end
    node
  end

  def find(value, node = root)
    return node if node.nil? || node.value == value

    value < node.value ? find(value, node.left) : find(value, node.right)
  end

  def level_order(node = root, queue = [])
    print "#{node.value} "
    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
    return if queue.empty?

    level_order(queue.shift, queue)
  end

  def preorder(node = root)
    return if node.nil?

    print "#{node.value} "
    preorder(node.left)
    preorder(node.right)
  end

  def inorder(node = root)
    return if node.nil?

    inorder(node.left)
    print "#{node.value} "
    inorder(node.right)
  end

  def postorder(node = root)
    return if node.nil?

    postorder(node.left)
    postorder(node.right)
    print "#{node.value} "
  end

  def height(node = root)
    unless node.nil? || node == root
      node = (node.instance_of?(Node) ? find(node.value) : find(node))
    end

    return -1 if node.nil?

    [height(node.left), height(node.right)].max + 1
  end

  def depth(node = root, parent = root, edges = 0)
    return 0 if node == parent
    return -1 if parent.nil?

    if node < parent.value
      edges += 1
      depth(node, parent.left, edges)
    elsif node > parent.value
      edges += 1
      depth(node, parent.right, edges)
    else
      edges
    end
  end

  def balanced?(node = root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)
    return true if (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)

    false
  end

  def rebalance
    @value = inorder_array
    @root = build_tree(value)
  end

  def pretty_print(node = root, prefix = '', is_left: true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def leftmost_leaf(node)
    node = node.left until node.left.nil?
    node
  end

  def inorder_array(node = root, array = [])
    unless node.nil?
      inorder_array(node.left, array)
      array << node.value
      inorder_array(node.right, array)
    end
    array
  end
end
