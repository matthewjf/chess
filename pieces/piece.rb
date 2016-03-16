class Piece
  attr_accessor :pos
  attr_reader :color

  def initialize(board, pos, color)
     @board = board
     @pos = pos
     @color = color
  end

  def valid_move?(end_pos)
    moves.include?(end_pos) && !@board.in_check?(@color)
  end

  def valid_moves
    moves # something about check and checkmate (mabye)
  end

  def dup(board)
    Piece.new(board,@pos,@color)
  end
end
