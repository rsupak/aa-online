require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    system('clear')
  end
end
