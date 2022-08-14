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

### knight_moves_hash
# class Vertex
#   attr_accessor :coordinate, :from, :to

#   def initialize(coordinate)
#     @coordinate = coordinate
#     @from = nil
#     @to = []
#   end
# end

# start = [1, 1]
# visited = []

# def within_board(moves)
#   moves.select { |move| move.first.between?(1, 8) && move.last.between?(1, 8) }
# end

# def build_knight_graph(coordinate = [1, 1], from = nil, visited = []) 
#   root = Vertex.new(coordinate)
#   root.from = from
#   root.to = within_board(Knight.new.next_possible_moves(coordinate))
#   root.to = root.to - visited
#   visited << root.to

#   root.to = root.to.map { |node| build_knight_graph(node, root, visited.flatten(1)) }

#   root
# end

# graph = build_knight_graph
# p graph

def within_board(moves)
  moves.select { |move| move.first.between?(1, 8) && move.last.between?(1, 8) }
end

def knight_moves(start_pos, end_pos)
  knight = Knight.new
  queue = [[start_pos]]
  count = 0

  until queue.empty?
    current = queue.first
    count += 1

    break if current.any? { |c| c == end_pos }

    # next_moves = within_board(knight.next_possible_moves(current))
    # next_moves.each { |move| queue.push(move) }
    queue << within_board(knight.next_possible_moves(current.flatten(1)))

    queue.uniq!
    queue.shift
  end

  { queue: queue, count: count}
end

p knight_moves([3, 3], [4, 3])
