class Node
  def initialize(val)
    @val = val
    @next = nil
  end
  attr_accessor :val, :next
end

class Queue
  def initialize
    @front = nil
    @back = nil
  end

  def empty?
    @front.nil? && @back.nil?
  end

  def enqueue(val)
    node = Node.new(val)
    if empty?
      @front = node
      @back = node
    else
      @back.next = node
      @back = node
    end
    val
  end

  def dequeue
    return if empty?
    val = @front.val
    @front = @front.next
    @back = nil if @front.nil?
    val
  end

  def peek
    @front.val
  end
end
