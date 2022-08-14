# frozen_string_literal: true

require_relative './knight'
require_relative './vertex'

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

  path = Vertex.traverse_ancestors(end_vertex)

  { path: path, moves: path.size - 1 }
end
# rubocop:enable Metrics/MethodLength
