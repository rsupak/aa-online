require_relative "code"

class Mastermind
  attr_reader :secret_code

  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(guess)
    puts "Exact Matches: #{@secret_code.num_exact_matches(guess)}"
    puts "Near Matches: #{@secret_code.num_near_matches(guess)}"
  end

  def ask_user_for_guess
    print 'Enter a code: '
    input = gets.chomp
    guess = Code.from_string(input)
    print_matches(guess)
    guess == secret_code
  end
end
