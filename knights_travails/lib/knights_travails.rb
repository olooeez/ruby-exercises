require_relative 'board'
require_relative 'knight'

game = Board.new
game.knight_moves([3, 3], [0, 0])
game.knight_moves([6, 3], [0, 0])
game.knight_moves([0, 0], [7, 7])
