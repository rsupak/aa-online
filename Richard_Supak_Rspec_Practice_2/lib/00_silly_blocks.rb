def reverser
  yield.split(' ').map(&:reverse).join(' ')
end

def adder(surplus = 1)
  yield + surplus
end

def repeater(times = 1)
  times.times { yield }
end
