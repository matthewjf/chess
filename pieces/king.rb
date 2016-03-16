class King < Piece
  include Steppyable

  def to_s
    if @color == :black
      '♔'
    else
      '♚'
    end
  end

  def moves

    cur_r, cur_c = pos
    @board.all_pos.reject do |x,y|
      (x - cur_r).abs > 1 || (y - cur_c).abs > 1 || (x == cur_r && y == cur_c) || not_takeable?([x,y])
    end
  end
end
