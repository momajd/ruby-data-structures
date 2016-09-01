require_relative 'static_array'

class RingBuffer
  def initialize
    @store = StaticArray.new(4)
    @start_idx = 0
    @capacity = 4
    @count = 0
  end
  attr_reader :count

  def [](logical_idx)
    raise 'out of bounds' unless logical_idx.between?(0, @count - 1)
    @store[physical_idx(logical_idx)]
  end

  def []=(logical_idx, val)
    raise 'out of bounds' unless logical_idx.between?(0, @count - 1)
    @store[physical_idx(logical_idx)] = val
  end

  def push(val)
    resize! if @count == @capacity
    @count += 1
    self[@count - 1] = val
    @store
  end

  def pop
    raise 'out of bounds' if @count == 0
    count -= 1
    deleted = self[@count - 1]
    self[@count - 1] = nil
    deleted
  end

  def shift
    raise 'out of bounds' if @count == 0
    @count -= 1
    deleted = self[0]
    self[0] = nil
    @start_idx += 1
    deleted
  end

  def unshift(val)
    resize! if @count == @capacity
    @count += 1
    @start_idx -= 1
    self[0] = val
    @store
  end

  private
  def physical_idx(logical_idx)
    (logical_idx + @start_idx) % @capacity
  end

  def resize!
    old_store = @store
    @store = StaticArray.new(@capacity * 2)
    @count.times {|i| @store[i] = old_store[physical_idx(i)]}
    @capacity *= 2
    @start_idx = 0
  end
end
