def measure(times = 1)
  start_time = Time.now
  times.times { yield }
  (Time.now - start_time) / times
end
