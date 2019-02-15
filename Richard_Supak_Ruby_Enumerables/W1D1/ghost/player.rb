class Player
  attr_reader :name

  #initialize
  def initialize(name)
    @name = name
  end

  # guess
  def guess(fragment)
    prompt(fragment)
    gets.chomp.downcase
  end

  # alert_invalid_guess
  def alert_invalid_guess(letter)
    puts "#{letter} is not a valid move!"
    puts 'Your guess must be a letter of the alphabet.'
    puts "You must be able to form a word starting with the new fragment.\n"
  end

  def inspect
    "#{name}"
  end

  def to_s
    name
  end

  private

  def prompt(fragment)
    puts "The current fragment is #{fragment}."
    print 'Add a letter: '
  end
end
