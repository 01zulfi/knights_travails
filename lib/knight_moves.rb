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

# for knight moves
class Knight
end

def coordinate_next?(coordinate, vertice)
  vertice.to.any? { |next_vertice| coordinate == next_vertice.coordinate }
end

def find_vertice(coordinate, vertice)
  return vertice if vertice.coordinate == coordinate

  vertice.to.each {|v| find_vertice(coordinate, v)} 
end

# def knight_moves(start_coordinate, end_coordinate = nil)
#   start_vertice = Vertice.new(start_coordinate)

#   start_vertice.from = Vertice.new([1,4]) 
#   start_vertice.to = within_board(next_moves(start_vertice.coordinate)).reject { |coordinate| coordinate == start_vertice.from.coordinate }.map { |coordinate| Vertice.new(coordinate, start_vertice) }
#   p start_vertice.to.map(&:coordinate)
#   p coordinate_next?([2, 2], start_vertice)
#   p coordinate_next?([1, 2], start_vertice)
# end

def rec(vertice, to_find)
  p vertice
  vertice.to = within_board(next_moves(vertice.coordinate)).reject { |coordinate| vertice.from ? coordinate == vertice.from.coordinate : false}.map { |coordinate| Vertice.new(coordinate, vertice) }

  # p vertice
  return print_path(find_vertice(to_find, vertice)) if coordinate_next?(to_find, vertice)

  vertice.to.each { |next_vertice| rec(next_vertice, to_find)}

  "can't, find"
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

def within_board(moves)
  moves.select { |move| move.first.between?(1, 8) && move.last.between?(1, 8) }
end

def print_path(vertice)
  return vertice.coordinate if vertice.from.nil?

  p vertice.coordinate
  print_path(vertice.from)
end

# knight_moves([3, 5])
rec(Vertice.new([3,5]), [1, 4])
