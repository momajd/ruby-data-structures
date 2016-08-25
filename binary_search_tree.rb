class BSTNode
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
  attr_accessor :val, :left, :right

  def insert(val, root = self)
    if val < @val
      root.left ? insert(val, root.left) : root.left = BSTNode.new(val)
    else
      root.right ? insert(val, root.right) : root.right = BSTNode.new(val)
    end
    val
  end
end
