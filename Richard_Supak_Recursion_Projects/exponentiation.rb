def exp(b, n)
  return 1 if n.zero?

  b * exp(b, n - 1)
end

def exp_two(b, n)
  return 1 if n.zero?
  return (exp_two(b, n / 2) * exp_two(b, n / 2)) if n.even?

  b * (exp_two(b, n / 2) * exp_two(b, n / 2)) if n.odd?
end

if $PROGRAM_NAME == __FILE__
  p exp(2, 1)
  p exp(3, 2)
  p exp_two(2, 1)
  p exp_two(4, 5)
end
