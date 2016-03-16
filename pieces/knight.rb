class Knight < Piece
  include Steppyable

  def to_s
    if @color == :black
      '♘'
    else
      '♞'
    end
  end

  def moves
    cur_r, cur_c = @pos
    @board.all_pos.reject do |new_r, new_c|
      row_diff = (new_r - cur_r).abs
      col_diff = (new_c - cur_c).abs
      row_diff > 2 || col_diff > 2 || row_diff + col_diff != 3 || not_takeable?([new_r, new_c])
    end
  end
end
