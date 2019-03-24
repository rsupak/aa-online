class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      system('clear')
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    @seq.each do |color| 
      puts color
      sleep 0.75
      system('clear')
      sleep 0.25
    end
    add_random_color
    puts @seq.last
    sleep 0.5
    system('clear')
  end

  def require_sequence
    puts 'Repeat the sequence by entering the first character of the color.'
    @seq.each.with_index do |color, i|
      print "#{i + 1}: "
      user_input = gets.chomp
      if color[0] != user_input
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    @seq += COLORS.sample(1)
  end

  def round_success_message
    puts 'Excellent Memory!'
    sleep 0.75
  end

  def game_over_message
    puts "Game Over! You remembered #{@sequence_length - 1} colors."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

game = Simon.new
game.play
