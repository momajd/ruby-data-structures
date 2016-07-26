# Adjacency list
class Vertex
  def initialize(val)
    @val = val
    @adjacent_vertices = []
  end
  attr_accessor :val, :adjacent_vertices

  def inspect
    "#{@val} : #{@adjacent_vertices.map {|v| v.val}}"
  end
end

require 'Set'
class Graph
  attr_reader :vertices
  def initialize
    # use set so we don't add duplicates into the graph
    @vertices = Set.new
  end

  def add_edge(vertex1, vertex2)
    @vertices.add(vertex1)
    @vertices.add(vertex2)
    vertex1.adjacent_vertices << vertex2
    self
  end

  def inspect
    "\n" + @vertices.inject("") do |str, vertex|
      "#{str.concat(vertex.val.to_s)} : #{vertex.adjacent_vertices.map {|v| v.val}} \n"
    end
  end
end

v1 = Vertex.new(1)
v2 = Vertex.new(2)
v3 = Vertex.new(3)
v4 = Vertex.new(4)
v5 = Vertex.new(5)

graph = Graph.new
graph.add_edge(v1, v2)
graph.add_edge(v1, v3)
graph.add_edge(v2, v4)
graph.add_edge(v4, v5)
