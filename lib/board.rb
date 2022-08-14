# frozen_string_literal: true

# 8x8 chess board
class Board
  attr_reader :board, :knight_position

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @root = nil
    @knight_position = nil
  end

  def place(coordinate, piece)
    x, y = transform_coordinates(coordinate)
    board[x][y] = piece
    @root = build_next_branches([x, y])
    @knight_position = [x, y]
  end

  def print_board
    board.each do |row|
      p row
      puts "\n"
    end
  end

  private

  def build_next_branches(root) 
    x, y = transform_coordinates(@knight_position) 
    knight = board[x][y]
    legal_moves = within_board(knight.next_possible_moves(x, y))
  end

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
