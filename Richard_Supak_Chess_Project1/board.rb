require_relative 'piece'

class Board
  attr_accessor :board, :white_pieces, :black_pieces
  def initialize
    @rows = Array.new(8) { Array.new(8) { nil } }
    @white_pieces = []
    @black_pieces = []
    gather_pieces
    setup_board
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @rows[row][col] = piece
  end

  def move_piece(start_pos, end_pos)
    raise "No piece here" if self[start_pos].nil?
    piece = self[start_pos]
    self[end_pos]= piece
    self[start_pos] = nil
  end

  private

  def gather_pieces
    back_row = %w[rook knight bishop queen king bishop knight rook]
    back_row.each.with_index do |piece, i|
      @white_pieces << Piece.new
      @black_pieces << Piece.new
    end
    8.times do |i|
      @white_pieces << Piece.new
      @black_pieces << Piece.new
    end
  end

  def setup_board
    @rows[0] = @white_pieces[0..7]
    @rows[1] = @white_pieces[8..15]
    @rows[6] = @black_pieces[8..15]
    @rows[7] = @black_pieces[0..7]
  end
end
