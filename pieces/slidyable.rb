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

  def piece_between?(new_pos)
    row,col = @pos
    new_row, new_col = new_pos
    until row == new_row && col == new_col
       unless @board.empty?([row, col]) || [row, col] == @pos
        return true
      end
      row_vector = new_row <=> row
      col_vector = new_col <=> row
      row += row_vector
      col += col_vector
    end
    return false
  end
end
