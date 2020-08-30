class Array
  def bubble_sort!(&prc)
    prc ||= proc { |x, y| x <=> y }
    sorted = false
    until sorted
      sorted = true
      each_index do |i|
        next if i + 1 == length

        j = i + 1
        if prc.call(self[i], self[j]) == 1
          sorted = false
          self[i], self[j] = self[j], self[i]
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    dup.bubble_sort!(&prc)
  end

  def my_all?
    my_any? do |elem|
      return false if !yield(elem)
    end
    true
  end

  def my_any?
    my_each { |elem| return true if yield(elem)}
  end

  def my_each
    length.times { |elem| yield(self[elem]) }
    self
  end

  def my_each_with_index
    length.times { |elem| yield(self[elem], elem) }
    self
  end

  def my_flatten
    result = []
    my_each do |elem|
      if elem.is_a? Array
        result += elem.my_flatten
      else
        result << elem
      end
    end
    result
  end

  def my_join(connection = '')
    result = ''
    self[0...-1].my_each { |elem| result << char + connection }

    result += last
  end

  def my_reject
    result = []
    my_each { |elem| result << elem unless yield(elem) }
    result
  end

  def my_rotate(num = 1)
    # return self if num.zero?

    # temp = clone
    # if num.positive?
    #   while num.positive?
    #     temp << temp.shift
    #     num -= 1
    #   end
    # else
    #   while num.negative?
    #     temp.unshift(temp.pop)
    #     num += 1
    #   end
    # end
    # temp
    return self if num.zero?

    temp = clone
    if num.positive?
      temp << temp.shift
      temp.my_rotate(num - 1)
    else
      temp.unshift(temp.pop)
      temp.my_rotate(num + 1)
    end
  end

  def my_select
    result = []
    my_each { |elem| result << elem if yield(elem) }
    result
  end

  def my_zip(*args)
    result = []
    my_each_with_index do |elem, i|
      sub = [elem]
      args.each { |arr| sub << arr[i] }
      result << sub
    end
    result
  end

  def my_reverse
    result = []
    (size - 1).downto(0) { |elem| result << self[elem] }
    result
  end
end

def factor(num)
  factors = []
  (1..Math.sqrt(num)).each { |i| factors << i if (num % i).zero? }
  factors
end

def substrings(string)
  subs = []

  string.length.times do |sub_start|
    (sub_start...(string.length)).each do |sub_end|
      sub = string[sub_start..sub_end]
      subs << sub unless subs.include?(sub)
    end
  end
  subs
end

def subwords(word, dictionary)
  substrings(word).select do |substr|
    dictionary.include?(substr)
  end
end

arr = [1,2,3,4]
rotated = arr.my_rotate(1)
puts "Original #{arr}"
puts "Rotated #{rotated}"
puts
arr = [1,2,3,4]
rotated = arr.my_rotate(-1)
puts "Original #{arr}"
puts "Rotated #{rotated}"
