class Node
  def initialize(key, val)
    @key, @val = key, val
    @next, @prev = nil, nil
  end
  attr_accessor :key, :val, :next, :prev

  def inspect
    "(#{key}: #{val})"
  end
end

class LinkedList
  def initialize
    @head = Node.new(nil, nil)
    @tail = Node.new(nil, nil)

    @head.next = @tail
    @tail.prev = @head
  end

  def insert(key, val)
    node = Node.new(key, val)
    @tail.prev.next = node
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev = node
  end

  def remove(key)
    node = find_node(key)
    return unless node
    node.prev.next = node.next
    node.next.prev = node.prev
    key
  end

  def find_node(key)
    self.find {|node| node.key == key}
  end

  include Enumerable
  def each(&prc)
    current = @head.next
    until current == @tail
      prc.call(current)
      current = current.next
    end
  end

  def inspect
    nodes = self.map {|node| "(#{node.key}: #{node.val})"}
    nodes.join(" -> ")
  end
end
