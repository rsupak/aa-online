# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str.each_char do |c|
    str.delete!(c) if c == c.downcase
  end
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  mid = str.length / 2
  str.length.even? ? str[mid-1..mid] : str[mid]
end

# Return the number of vowels in a string.
VOWELS = %w[a e i o u].freeze
def num_vowels(str)
  count = 0
  str.each_char do |c|
    count += 1 if VOWELS.include?(c.downcase)
  end
  count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  num == 1 ? num * 1 : num * factorial(num - 1)
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = '')
  new_str = ''
  return new_str if arr.empty?

  arr.each do |c|
    new_str << c + separator unless c == arr.last
  end
  new_str + arr.last
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  arr = str.split('')
  arr.each_index do |i|
    (i % 2).zero? ? arr[i].downcase! : arr[i].upcase!
  end.join
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  arr = str.split
  new_arr = []
  arr.each do |word|
    word.length >= 5 ? new_arr << word.reverse : new_arr << word
  end
  new_arr.join(' ')
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  arr = []
  (1..n).each do |num|
    mod3 = (num % 3).zero?
    mod5 = (num % 5).zero?
    result = ''
    result += 'fizz' if mod3
    result += 'buzz' if mod5
    result.empty? ? arr.push(num) : arr.push(result)
  end
  arr
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  len = arr.length - 1
  new_arr = []
  while len >= 0
    new_arr << arr[len]
    len -= 1
  end
  new_arr
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  return false if num < 2

  return true if num <= 3

  return false if (num % 2).zero? || (num % 3).zero?

  i = 5
  while i < Math.sqrt(num)
    return false if (num % i).zero?

    i += 1
  end
  true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  arr = [1]
  i = 1
  while i <= num
    arr << i if (num % i).zero?
    i += 1
  end
  arr.uniq.sort
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  arr = factors(num)
  new_arr = []
  arr.each do |n|
    new_arr << n if prime?(n)
  end
  new_arr
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  evens = arr.select(&:even?)
  odds = arr.select(&:odd?)
  evens.length == 1 ? evens[0] : odds[0]
end
