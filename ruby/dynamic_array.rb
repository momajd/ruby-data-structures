require_relative 'static_array'

class DynamicArray
  def initialize
    @store = StaticArray.new(8)
    @length = 0
  end

  def [](idx)
    raise 'out of bounds' unless idx.between?(0, @length - 1)
    @store[idx]
  end

  def []=(idx, val)
    raise 'out of bounds' unless idx.between?(0, @length - 1)
    @store[idx] = val
  end

  def pop
    raise 'out of bounds' if @length == 0
    deleted = @store[@length - 1]
    @store[@length - 1] = nil
    @length -= 1
    deleted
  end

  def push(val)
    resize! if @length == @store.length
    @store[@length] = val
    @length += 1
    val
  end

  def resize!
    old_store = @store
    @store = StaticArray.new(@length * 2)
    @length.times {|idx| @store[idx] = old_store[idx]}
  end
end
