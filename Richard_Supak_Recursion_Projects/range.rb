def range(start, finish)
  return [] if finish < start

  [start] + range(start + 1, finish)
end

p range(-1, 5)
