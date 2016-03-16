class Piece
  attr_accessor :pos
  attr_reader :color

  def initialize(board, pos, color)
     @board = board
     @pos = pos
     @color = color
  end

  def valid_move?(end_pos)
    moves.include?(end_pos) # && not in check && maybe something about checkmate not sure yet
  end

  def valid_moves
    moves # something about check and checkmate (mabye)
  end
end
