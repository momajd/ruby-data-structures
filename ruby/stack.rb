class Node
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

class Stack
  def initialize
    @top = nil
  end

  def push(val)
    node = Node.new(val)
    if @top.nil?
      @top = node
    else
      node.next = @top
      @top = node
    end
    val
  end

  def pop
    return if empty?
    popped_val = peek
    @top = @top.next
    popped_val
  end

  def peek
    @top.val
  end

  def empty?
    @top.nil?
  end

end
