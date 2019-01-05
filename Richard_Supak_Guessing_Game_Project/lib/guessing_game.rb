class GuessingGame
  attr_accessor :min, :max, :secret_num, :num_attempts, :game_over

  def initialize(min, max)
    @min = min
    @max = max
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
  end

  def game_over?
    game_over
  end

  def check_num(num)
    @num_attempts += 1
    @game_over = true if num == secret_num
    result = num == secret_num ? 'you win' : high_low(num)
    puts result
  end

  def high_low(num)
    num < secret_num ? 'too small' : 'too big'
  end

  def ask_user
    print 'enter a number '
    input = gets.chomp.to_i
    check_num(input)
  end
end
