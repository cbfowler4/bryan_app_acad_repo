class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  # O(1)
  def insert(num)
    validate!(num)
    @store[num] = true
  end

  # O(1)
  def remove(num)
    validate!(num)
    @store[num] = false
  end

  # O(1)
  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @max)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  # amortized O(1) if num_bucks << 
  #O(n) 
  def insert(num)
    self[num] << num unless include?(num)
  end

  # O(n)
  def remove(num)
    self[num].delete(num)
  end

  # O(n)
  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    idx = num % num_buckets
    @store[idx]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  # O(1) amortized 
  # O(n^2) worst case
  def insert(num)
    resize! if count >= num_buckets

    unless include?(num)
      self[num] << num 
      @count += 1
    end
  end

  # O(1) 
  def remove(num)
    result = self[num].delete(num)
    @count -= 1 if result
  end

  # O(1)
  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    idx = num % num_buckets
    @store[idx]
  end

  def num_buckets
    @store.length
  end

  # O(n)
  # O(n^2) worst case (not realistic)
  def resize!
    new_size = 2 * num_buckets  
    new_store = Array.new(new_size) { Array.new }
        
    @store.each do |bucket|
      bucket.each do |int|
        new_store[int % new_size] << int
      end
    end
    
    @store = new_store 
  end
end
