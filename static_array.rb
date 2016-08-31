class StaticArray
  def initialize(size)
    @store = Array.new(size)
  end

  def [](idx)
    @store[idx]
  end

  def []=(idx, val)
    @store[idx] = val
  end
end
