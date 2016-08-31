class StaticArray
  def initialize(size)
    @store = Array.new(size)
  end

  def length
    @store.length
  end

  def [](idx)
    @store[idx]
  end

  def []=(idx, val)
    raise 'out of range' if idx >= length
    @store[idx] = val
  end
end
