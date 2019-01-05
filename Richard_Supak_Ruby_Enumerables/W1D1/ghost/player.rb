class Player
  attr_reader :name

  #initialize
  def initialize(name)
    @name = name
  end

  # guess
  def guess(fragment)
    puts "The current fragment is #{fragment}."
    print 'Add a letter: '
    gets.chomp.downcase
  end

  # alert_invalid_guess
  def alert_invalid_guess(letter)
  end
end
