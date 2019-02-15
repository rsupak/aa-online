def upcase(str)
  return str.upcase if str.length < 1 # base case

  str[0].upcase + upcase(str[1..-1]) # inductive step
end

def iterative_upcase(str)
  str.chars.inject('') { |upcase_str, char| upcase_str << char.upcase! }
end

def reverse(str)
  return str if str.length <= 1

  str[-1] + reverse(str[0..-2])
end

def quick_sort(arr)
  return arr if arr.length <= 1

  pivot = arr.delete_at(rand(arr.size))
  left, right = arr.partition { |num| pivot > num }

  [*quick_sort(left), pivot, *quick_sort(right)]
end

def factorial(n)
  return 1 if n.zero?

  n * factorial(n - 1)
end


# p reverse('hello')
# p iterative_upcase('hello')

# shuffled_array = Array.new(20) { rand(-100..100) }
# puts "Shuffled Array: #{shuffled_array}"
# puts "Sorted Array: #{quick_sort(shuffled_array)}"

p factorial(9)
