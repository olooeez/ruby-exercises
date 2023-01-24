class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def append(value)
    if head.nil?
      @head = Node.new(value)
    else
      current_node = head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    new_head = Node.new(value)
    new_head.next_node = head
    @head = new_head
  end

  def size
    size = 0
    current_node = head
    while current_node
      size += 1
      current_node = current_node.next_node
    end
    size
  end

  def tail
    current_node = head
    return nil if current_node.nil?

    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def at(index)
    count = 0
    current_node = head
    while current_node
      return current_node if count == index

      current_node = current_node.next_node
      count += 1
    end
    nil
  end

  def pop
    return nil if head.nil?

    current_node = head
    if current_node.next_node.nil?
      @head = nil
      return current_node
    end
    current_node = current_node.next_node while current_node.next_node.next_node
    last_node = current_node.next_node
    current_node.next_node = nil
    last_node
  end

  def contains?(value)
    current_node = head
    while current_node
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    index = 0
    current_node = head
    while current_node
      return index if current_node.value == value

      current_node = current_node.next_node
      index += 1
    end
    nil
  end

  def to_s
    current_node = head
    string = ''
    while current_node
      string += "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
    "#{string}nil"
  end
end
