class Queen < Piece
  include Slidyable
  def moves
    possible_moves = straight_moves + diagonal_moves
    possible_moves.reject { |pos| piece_between?(pos) }
    # do something about colors
  end


end
