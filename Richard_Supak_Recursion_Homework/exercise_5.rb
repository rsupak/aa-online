def reverse(string)
  return string if string.length <= 1

  string[-1] + reverse(string[0..-2])
end

p reverse('')
