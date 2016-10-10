class BSTNode
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
  attr_accessor :val, :left, :right

  def insert(val)
    puts self.val
    if val < self.val
      self.left ? self.left.insert(val) : self.left = BSTNode.new(val)
    else
      self.right ? self.right.insert(val) : self.right = BSTNode.new(val)
    end
    val
  end

  def find(val)
    return self if @val == val

    if val < self.val
      self.left.find(val)
    else
      self.right.find(val)
    end
  end

  def delete(val)
    # if node.left.nil? && node.right.nil?
  end
end
