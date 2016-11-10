class Heap
  def initialize
    @store = []
  end
  attr_reader :store

  def min
    @store.first
  end

  def insert(val)
    @store.push(val)
    heapify_up!
    val
  end

  def pop_min
    swap!(0, @store.length - 1) #swap first and last el then heapify down
    popped_val = @store.pop
    heapify_down!
    popped_val
  end

  private
  def swap!(idx1, idx2)
    @store[idx1], @store[idx2] = @store[idx2], @store[idx1]
  end

  def parent_idx(idx)
    return 0 if idx.zero?
    (idx - 1) / 2
  end

  def child_indeces(idx)
    [2 * idx + 1, 2 * idx + 2].select {|i| i < @store.length}
  end

  def heapify_up!
    i = @store.length - 1
    while @store[i] < @store[parent_idx(i)]
      swap!(i, parent_idx(i))
      i = parent_idx(i)
    end
  end

  def heapify_down!
    i = 0
    min_child_idx = child_indeces(i).min_by {|idx| @store[idx]}
    while (min_child_idx &&
      @store[i] > @store[min_child_idx])
        swap!(i, min_child_idx)
        i = min_child_idx
        min_child_idx = child_indeces(i).min_by {|idx| @store[idx]}
    end
  end
end
