# frozen_string_literal: true

# knight class
class Knight
  def next_moves(coordinate)
    within_board(next_possible_moves(coordinate))
  end

  private

  def next_possible_moves(coordinate)
    x, y = coordinate
    [[x + 2, y + 1],
     [x + 2, y - 1],
     [x - 2, y + 1],
     [x - 2, y - 1],
     [x + 1, y + 2],
     [x - 1, y + 2],
     [x + 1, y - 2],
     [x - 1, y - 2]]
  end

  def within_board(moves)
    moves.select { |move| move.first.between?(0, 7) && move.last.between?(0, 7) }
  end
end
