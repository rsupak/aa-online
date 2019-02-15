def fibonnaci(n)
  array = [0, 1]
  until array.length == n
    array << array[array.length - 1] + array[array.length - 2]
  end
  array
end

def fib_rec(n)
  return [] if n.zero?
  return [0] if n == 1
  return [0, 1] if n == 2

  sequence = fib_rec(n - 1)
  sequence << sequence[-2] + sequence[-1]
end
