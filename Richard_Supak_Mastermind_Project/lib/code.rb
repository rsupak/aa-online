class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def initialize(chars)
    raise exception unless Code.valid_pegs?(chars)

    @pegs = chars.map(&:upcase)
  end

  def self.valid_pegs?(chars)
    valid = true
    chars.each { |char| return false unless POSSIBLE_PEGS.key?(char.upcase) }
    valid
  end

  def self.random(length)
    new_code = []
    while length > 0
      new_code << POSSIBLE_PEGS.keys.sample
      length -= 1
    end
    Code.new(new_code)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(''))
  end

  def length
    @pegs.length
  end

  def ==(other)
    pegs == other.pegs
  end

  def [](index)
    @pegs[index]
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each.with_index do |peg, i|
      count += 1 if guess[i] == pegs[i]
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each.with_index do |peg, i|
      count += 1 if pegs.include?(guess[i]) && guess[i] != pegs[i]
    end
    count
  end
end
