require 'Set'

# Adjacency list
class Vertex
  def initialize(val)
    @val = val
    @adjacents = Set.new
  end
  attr_accessor :val, :adjacents

  def inspect
    "#{@val} : #{@adjacents.map {|v| v.val}}"
  end
end

class Graph
  attr_reader :vertices
  def initialize
    # use set so we don't add duplicates into the graph
    @vertices = Set.new
  end

  def add_edge(vertex1, vertex2)
    @vertices.add(vertex1)
    @vertices.add(vertex2)
    vertex1.adjacents.add(vertex2)
    self
  end

  def inspect
    "\n" + @vertices.inject("") do |str, vertex|
      "#{str.concat(vertex.val.to_s)} : #{vertex.adjacents.map {|v| v.val}} \n"
    end
  end
end

v1 = Vertex.new(1)
v2 = Vertex.new(2)
v3 = Vertex.new(3)
v4 = Vertex.new(4)
v5 = Vertex.new(5)
v6 = Vertex.new(6)

graph = Graph.new
graph.add_edge(v1, v2)
graph.add_edge(v1, v3)
graph.add_edge(v2, v4)
graph.add_edge(v4, v5)
graph.add_edge(v4, v3)
graph.add_edge(v3, v6)
