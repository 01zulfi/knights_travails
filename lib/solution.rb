# frozen_string_literal: true

# knight
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

# vertex
class Vertex
  attr_accessor :data, :from

  def initialize(data, from)
    @data = data
    @from = from
  end

  def self.traverse_ancestors(vertex)
    path = [vertex.data]
    current = vertex
    until current.from.nil?
      current = current.from
      path << current.data
    end
    path.reverse
  end
end

# rubocop:disable Metrics/MethodLength
def knight_moves(start_pos, end_pos)
  knight = Knight.new
  queue = [Vertex.new(start_pos, nil)]
  end_vertex = nil

  until queue.empty?
    current = queue.first

    if current.data == end_pos
      end_vertex = current
      break
    end

    next_moves = knight.next_moves(current.data)
    next_moves.each { |next_move| queue.push(Vertex.new(next_move, current)) }

    queue.shift
  end

  Vertex.traverse_ancestors(end_vertex)
end
# rubocop:enable Metrics/MethodLength

p '0,0 to 1,2'
p knight_moves([0, 0], [1, 2]) #=> [0, 0], [1, 2]
p '0,0 to 3,3'
p knight_moves([0, 0], [3, 3]) #=> [0, 0], [2, 1], [3, 3]
p '3,3 to 0,0'
p knight_moves([3, 3], [0, 0]) #=> [3, 3], [1, 2], [0, 0]
p '3,3 to 4,3'
p knight_moves([3, 3], [4, 3]) #=> [3, 3], [5, 4], [3, 5], [4, 3]
