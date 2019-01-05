require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player
  attr_accessor :remaining_misses

  def initialize(num)
    @player = Player.new
    @board = Board.new(num)
    @remaining_misses = board.size / 2
  end

  def start_game
    board.place_random_ships
    puts "#{board.num_ships} remaining"
    board.print
  end

  def valid_move?(move)
    move[0] < Math.sqrt(board.size).to_i || move[1] < Math.sqrt(board.size).to_i
  end

  def turn
    move = player.get_move

    turn until move.size == 2
    turn until valid_move?(move)

    board.attack(move) ? @remaining_misses : @remaining_misses -= 1
    puts @remaining_misses
    board.print
  end

  def lose?
    puts 'You lose!' if remaining_misses <= 0
    remaining_misses <= 0
  end

  def win?
    puts 'You win!' if board.num_ships.zero?
    board.num_ships.zero?
  end

  def game_over?
    win? || lose?
  end
end
