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

    result += self.last
  end

  def my_reject
    result = []
    my_each { |elem| result << elem unless yield(elem) }
    result
  end

  def my_rotate(num = 1)
    while num > 0
      self << shift
      num -= 1
    end
    self
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

dictionary = ['home', 'break', 'bob', 'cat', 'goal']
word = 'zgoalbreaktribeoakcattomb'

# p [1, 2, 3].my_each { |num| puts num }
# p [1, 2, 3].my_each_with_index { |num, i| puts "#{num}, #{i}" }
# p [1, 2, 3].my_select { |num| num.odd? }
# p [1 ,2, 3].my_reject { |num| num.odd? }
# p [1, 2, 3].my_any? { |num| num.odd? }
# p [1, 2, 3].my_all? { |num| num.even? }
# p [1, 2, [3, 4]].my_flatten
# a = [4, 5, 6]
# b = [7, 8, 9]
# p [1, 2, 3].my_zip(a, b)
# p a.my_zip([1,2], [8])
# p [1,2].my_zip(a, b)
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1,2].my_zip(a, b, c, d)
# p [1, 2, 3, 4].my_rotate
# p [1, 2, 3, 4].my_rotate(2)
# p %w[a b c].join
# p %w[a b c].join('$')
# p [1,2,3].my_reverse
p factor(256)
p [1,3,2,6,4,8].bubble_sort!
p [3,6,2,8,4,7].bubble_sort
p subwords(word, dictionary)
