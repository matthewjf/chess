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
    cur_r,cur_c = @pos
    new_r, new_c = new_pos
    new_r += (cur_r <=> new_r)
    new_c += (cur_c <=> new_c)
    return false if [new_r, new_c] == @pos
    if @board.empty?([new_r, new_c])
      piece_between?([new_r, new_c])
    else
      true
    end
  end

  def not_takeable?(new_pos)
    @color == @board[new_pos].color
  end

  def get_moves(moves)
    moves.reject do |pos|
      piece_between?(pos) || not_takeable?(pos)
    end
  end
end
