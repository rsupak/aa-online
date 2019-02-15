def merge_sort(collection)
  return collection unless collection.size > 1

  mid = collection.size / 2
  left, right = merge_sort(collection[0...mid]), merge_sort(collection[mid..-1])

  merge(left, right)
end

def merge(left, right)
  sorted = []
  while [left, right].none?(&:empty?)
    sorted << (left[0] < right[0] ? left.shift : right.shift)
  end
  sorted + left + right
end

if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-100...100) }

  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{merge_sort(shuffled_array)}"
end
