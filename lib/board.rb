# frozen_string_literal: true

# 8x8 chess board
class Board
  attr_reader :board, :knight_position

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @knight_position = [nil, nil]
  end

  def place(coordinate, piece)
    x, y = transform_coordinates(coordinate)
    board[x][y] = piece
    @knight_position = [x, y]
  end

  def mark_next_moves(coordinate)
    x, y = transform_coordinates(coordinate)
    knight = board[x][y]
    legal_moves = within_board(knight.next_possible_moves(@knight_position))
    p legal_moves
    legal_moves.each do |legal_move|
      board[legal_move.first][legal_move.last] = 'here'
    end
  end

  def print_board
    board.each do |row|
      p row
      puts "\n"
    end
  end

  private

  def within_board(moves)
    moves.select { |move| move.first.between?(1, 8) && move.last.between?(1, 8) }
  end

  def transform_coordinates(coordinate)
    [add_one(coordinate.first), add_one(coordinate.last)]
  end

  def add_one(num)
    num - 1
  end
end
