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

def dfs(root, val, visited = Set.new)
  return root if root.val == val
  visited.add(root)

  root.adjacent_vertices.each do |vertex|
    next if visited.include?(vertex)
    vertex = dfs(vertex, val, visited)
    return vertex if vertex
  end
  nil
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
