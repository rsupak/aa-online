def bsearch(array, value)
  return nil if array.empty?

  mid = array.length / 2
  case value <=> array[mid]
  when -1
    bsearch(array.take(mid), value)
  when 0
    mid
  when 1
    sub_search = bsearch(array.drop(mid + 1), value)
    sub_search.nil? ? nil : mid + 1 + sub_search
  end
end

if $PROGRAM_NAME == __FILE__
  p bsearch([1, 2, 3], 1) # => 0
  p bsearch([2, 3, 4, 5], 3) # => 1
  p bsearch([2, 4, 6, 8, 10], 6) # => 2
  p bsearch([1, 3, 4, 5, 9], 5) # => 3
  p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
  p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
  p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
end
