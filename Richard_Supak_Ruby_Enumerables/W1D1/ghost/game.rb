class Game
  def initialize(*players)
    @players = players
    @fragment = ''
    words = File.readlines('dictionary.txt').map(&:chomp)
    @dictionary = Set.new(words)
  end
end
