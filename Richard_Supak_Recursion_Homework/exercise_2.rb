def add_numbers(array)
  return if array.empty?
  return array.shift if array.size == 1

  array.shift + add_numbers(array)
end

p add_numbers([1,2,3,4])
