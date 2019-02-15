# gamma_fn(n) = (n - 1)!

def gamma_fnc(num)
  return if num <= 0
  return 1 if num == 1

  (num - 1) * gamma_fnc(num - 1)
end

p gamma_fnc(8)
