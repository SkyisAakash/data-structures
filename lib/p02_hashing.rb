class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.each_with_index.inject(20){|sum, (el, idx)| sum*idx ^ (el.to_s.ord) + idx**el.to_s.ord + idx}
  end
end

class String
  def hash
    self.chars.each_with_index.inject(self.chars[0].ord){ |sum, (char, idx)| idx ** char.ord}
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    puts(self.keys)
    # 0
    self.keys.sort.hash + self.values.sort.hash
  end
end
