require_relative 'p05_hash_map'

def can_string_be_palindrome?(string) 
  memory = HashMap.new()
  string.chars.each do |char|
    current = memory.get(char)
    if current
        current += 1
    else
        current = 1
    end
    memory.set(char, current)
  end
  counter = 0
  string.chars.each do |char|
    if memory.get(char) == 1
        counter += 1
    end
    return false if counter > 1
    end
    return true
end
