class Player
  def get_move
    print 'enter a position with coordinates separated by a space like `4 7`:'
    gets.chomp.split(' ').map(&:to_i)
  end
end
