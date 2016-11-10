require_relative 'heap'

class PriorityQueue

  def initialize
    @heap = Heap.new
    @map = {}
  end

  def insert_with_priority(obj, priority)
    @map[priority] = obj
    @heap.insert(priority)
  end

  def pop_highest_priority
    priority = @heap.pop_min
    value = @map.delete(priority)
    [value, priority]
  end

  def peek
    @map[@heap.min]
  end

  def inspect
    res = @heap.store.map {|i| @map[i]}
    res.to_s
  end

end
