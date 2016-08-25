class MySet
  def initialize
    @store = Array.new(8) {Array.new}
    @count = 0
  end

  def add(key)
    delete(key)
    resize! if @count == num_buckets
    bucket(key) << key
    @count += 1
    key
  end

  def delete(key)
    removed = bucket(key).delete(key)
    @count -= 1 if removed
    removed
  end

  def has_key?(key)
    bucket(key).include?(key)
  end

  def inspect
    keys = []
    @store.each do |bucket|
      bucket.each do |key|
        keys << key
      end
    end
    "{#{keys.join(",")}}"
  end

  private
  def bucket(key)
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) {Array.new}
    @count = 0
    old_store.each do |bucket|
      bucket.each do |key|
        self.add(key)
      end
    end
  end
end
