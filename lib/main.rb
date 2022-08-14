# frozen_string_literal: true

require_relative './board'
require_relative './knight'

board = Board.new
knight = Knight.new

board.place([1, 1], knight)
board.mark_next_moves
board.print_board
puts '---'
board.move_knight_to_next_moves
board.print_board
puts '---'
board.mark_next_moves
board.print_board
puts '---'
# board.move_knight_to_next_moves
# board.print_board
