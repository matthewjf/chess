class Queen < Piece
  include Slidyable
  
  def moves
    get_moves(straight_moves + diagonal_moves)
  end

  def to_s
    if @color == :black
      '♕'
    else
      '♛'
    end
  end
end
