def count_instances(array, tgt)
  array.map { |num| count_digits(num, tgt) }.sum
end

def count_digits(num, tgt)
  place_value = 1
  place_value *= 10 until num / place_value < 10
  expand_number(num, place_value, []).count(tgt)
end

def expand_number(num, place_value, accumulator)
  return accumulator << num if place_value == 1

  accumulator << num / place_value
  expand_number(num % place_value, place_value / 10, accumulator)
end

p count_instances([23, 202, 12, 42], 2) # => 5
