# frozen_string_literal: true

# vertex (node) class
class Vertex
  attr_reader :data, :from

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
