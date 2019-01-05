# returns sum of two numbers
def add(num1, num2)
  num1 + num2
end

# returns difference of two numbers
def subtract(num1, num2)
  num1 - num2
end

# returns sum of numbers in array
def sum(arr)
  arr.empty? ? 0 : arr.reduce(&:+)
end

# returns product of numbers passed in
def multiply(*nums)
  nums.reduce(1, :*)
end

# returns exponential product of base and power
def power(base, exponent)
  result = 1
  exponent.times { result *= base }
  result
end

# returns factorial product
def factorial(num)
  num <= 1 ? num : num * factorial(num - 1)
end
