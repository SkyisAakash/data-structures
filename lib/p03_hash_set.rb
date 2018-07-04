require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if self[key].include?(key)
    self[key] << key
    @count += 1
    resize! if @count > num_buckets
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key)
      @count -= 1
      end
  end

  private

  def [](key)
    @store[key.hash % @store.length]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old = @store
    @store = Array.new(old.length * 2) { Array.new }
    @count = 0
    old.flatten.each { |el| insert(el) }
  end
end
