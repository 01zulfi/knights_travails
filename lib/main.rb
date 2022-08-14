# frozen_string_literal: true

require_relative './knight_moves'

p '0,0 to 1,2'
p knight_moves([0, 0], [1, 2]) #=> { :path => [[0, 0], [1, 2]], :moves => 1 }
p '0,0 to 3,3'
p knight_moves([0, 0], [3, 3]) #=> { :path => [[0, 0], [2, 1], [3, 3]], :moves => 2 }
p '3,3 to 0,0'
p knight_moves([3, 3], [0, 0]) #=> { :path => [[3, 3], [1, 2], [0, 0]], :moves => 2 }
p '3,3 to 4,3'
p knight_moves([3, 3], [4, 3]) #=> { :path => [[3, 3], [5, 4], [3, 5], [4, 3]], :moves => 3 }
