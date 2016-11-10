class Node
  def initialize(key, val)
    @key, @val = key, val
    @next, @prev = nil, nil
  end
  attr_accessor :key, :val, :next, :prev

  def inspect
    "(#{@key}, #{@val})"
  end
end

class LRUCache
  def initialize(capacity = 5)
    @capacity = capacity
    @store = {}
    # doubly linked list w/ sentinel head and tail
    @head = Node.new(nil, nil)
    @tail = Node.new(nil, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def get(key)
    return unless @store.include?(key)
    update(@store[key])
    @store[key].val
  end

  def set(key, value)
    if @store.include?(key)
      @store[key].val = value
      update(@store[key])
    else
      eject! if @store.length == @capacity
      node = Node.new(key, value)
      insert(node)
      @store[key] = node
    end
  end

  def inspect
    list = []
    current = @head.next
    until current == @tail
      list << "(#{current.key}, #{current.val})"
      current = current.next
    end
    "store: #{@store}; linked list: #{list.join(" -> ")}"
  end

  private
  def insert(node)
    @tail.prev.next = node
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev = node
  end

  def update(node)
    node.prev.next = node.next
    node.next.prev = node.prev
    insert(node)
  end

  def eject!
    rm_node = @head.next
    rm_node.prev.next = rm_node.next
    rm_node.next.prev = rm_node.prev
    @store.delete(rm_node.key)
  end
end
