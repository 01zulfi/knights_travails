# frozen_string_literal: true

# knight
class Knight
  def initialize
    @name = 'knight'
  end

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
end
