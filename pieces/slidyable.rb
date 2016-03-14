module Slidyable
  def straight_moves
    vertical_moves + horizontal_moves
  end

  def vertical_moves
    current_row, current_col = @pos
    @board.all_pos.select do |x,y|
      y == current_col && x != current_row
    end
  end
  def horizontal_moves
    current_row, current_col = @pos
    @board.all_pos.select do |x,y|
      x == current_row && y != current_col
    end
  end
  def diagonal_moves
    current_row, current_col = @pos
    @board.all_pos.select do |x,y|
      ((current_row - x).abs == (current_col - y).abs) &&
      !(x == current_row && y == current_col)
    end
  end

end
