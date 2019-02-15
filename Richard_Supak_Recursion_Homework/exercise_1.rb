def sum_to(num)
  return 0 if num.zero?
  return nil if num < 0

  num + sum_to(num - 1)
end

puts sum_to(-8)
