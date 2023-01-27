require_relative 'knight'

class Board
  def create_children(parent)
    parent.moves.each do |move|
      child = find_child(move).nil? ? Knight.new(move) : find_child(move)
      parent.children << child
    end
  end

  def create_family_tree(destination, queue = [@alpha], index = 0)
    current = queue[index]
    create_children(current)
    current.children.each do |child|
      next if queue.include?(child)

      queue << child
    end

    return if current == find_child(destination)
    return if index >= 66

    index += 1
    create_family_tree(destination, queue, index)
  end

  def find_child(coordinates, queue = [@alpha], index = 0)
    found_knight = nil
    current = queue[index]
    return if current.nil?

    current.children.each do |child|
      queue << child unless queue.include?(child)
      found_knight = child if child.location == coordinates
    end
    index += 1
    return found_knight unless found_knight.nil?

    find_child(coordinates, queue, index)
  end

  def find_path(destination, path = [destination])
    parent = find_parent(destination)
    path << parent.location
    return path if parent == @alpha

    find_path(parent.location, path)
  end

  def find_parent(destination, queue = [@alpha], index = 0)
    current = queue[index]
    parent = current.moves.any? { |move| move == destination }
    return if current.nil?
    return current if parent == true

    current.children.each do |child|
      queue << child unless queue.include?(child)
    end
    index += 1
    find_parent(destination, queue, index)
  end

  def knight_moves(start, destination)
    @alpha = Knight.new(start)
    create_family_tree(destination)
    path = find_path(destination)
    puts "> You made it in #{path.size - 1} moves!  Here's your path:"
    path.each_with_index { |move, index| puts "> #{index}: #{move}" }
  end
end
