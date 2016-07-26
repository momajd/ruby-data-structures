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
    if @top.nil?
      @top = Node.new(val)
    else
      new_node = Node.new(val)
      new_node.next = @top
      @top = new_node
    end
    val
  end

  def pop
    return nil if empty?
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
