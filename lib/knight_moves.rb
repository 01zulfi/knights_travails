# frozen_string_literal: true

# vertices
class Vertice
  attr_reader :coordinate
  attr_accessor :from, :to

  def initialize(coordinate, from = nil)
    @coordinate = coordinate
    @from = from
    @to = []
  end
end

def coordinate_next?(coordinate, vertice)
  vertice.to.any? { |next_vertice| coordinate == next_vertice.coordinate }
end

def knight_moves(start_coordinate, end_coordinate = nil)
  start_vertice = Vertice.new(start_coordinate)

  start_vertice.to = valid_moves(next_moves(start_vertice.coordinate)).map { |coordinate| Vertice.new(coordinate, start_vertice) }
  p start_vertice.to.map(&:coordinate)
  p coordinate_next?([2, 2], start_vertice)
  p coordinate_next?([1, 2], start_vertice)
end

def next_moves(coordinate)
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

def valid_moves(moves)
  moves.select { |move| move.first.between?(1, 8) && move.last.between?(1, 8) }
end

knight_moves([1, 4])
