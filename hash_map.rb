require_relative 'linked_list'

class HashMap
  def initialize
    @store = Array.new(8) {LinkedList.new}
    @count = 0
  end

  def add(key, val)
    delete(key) #don't add duplicate keys
    resize! if num_buckets == @count
    bucket(key).insert(key, val)
    @count += 1
    key
  end

  def delete(key)
    removed = bucket(key).remove(key)
    @count -= 1 if removed
    removed
  end

  def get(key)
    bucket(key).find_node(key).val
  end

  def inspect
    res = []
    @store.each do |list|
      list.each do |node|
        res << "#{node.key} => #{node.val}"
      end
    end
    "{#{res.join(", ")}}"
  end

  private
  def num_buckets
    @store.length
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) {LinkedList.new}
    old_store.each do |list|
      list.each do |node|
        self.add(node.key, node.val)
      end
    end
  end
end
