class Node
  def initialize(key = nil, val = nil)
    @key, @val = key, val
    @next, @prev = nil, nil
  end
  attr_accessor :key, :val, :next, :prev

  def inspect
    "#{@key} => #{@val}"
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def insert(key, val)
    node = Node.new(key, val)

    node.prev = @tail.prev
    @tail.prev.next = node
    @tail.prev = node
    node.next = @tail
    node
  end

  def delete(key)
    current = get(key)

    if current
      current.prev.next = current.next
      current.next.prev = current.prev
      return current
    end
    nil
  end

  def get(key)
    self.find {|node| node.key == key}
  end

  def each(&prc)
    current = @head.next
    until current == @tail
      prc.call(current)
      current = current.next
    end
  end

  def inspect
    result = map {|node| "#{node.key} => #{node.val}"}.join(", ")
    "#{result}"
  end
end

class HashMap
  def initialize
    @store = Array.new(8) {LinkedList.new}
    @count = 0
  end
  attr_reader :store

  def add(key, val)
    resize! if @count == num_buckets
    remove(key) if get(key)

    bucket(key).insert(key, val)
    @count += 1
    key
  end

  def remove(key)
    removed = bucket(key).delete(key)
    @count -= 1 if removed
    removed
  end

  def get(key)
    bucket(key).get(key)
  end

  def inspect
    result = []
    @store.each do |list|
      list.each do |node|
        result << "#{node.key} => #{node.val}"
      end
    end
    result = result.join(", ")
    "{#{result}}"
  end

  private
  def num_buckets
    @store.length
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) {LinkedList.new}

    old_store.each do |list|
      list.each do |node|
        self.add(node.key, node.val)
      end
    end
  end
end
