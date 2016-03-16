class Pawn < Piece
  def initialize(board, pos, color)
    @moved = false
    super(board, pos, color)
  end

  def to_s
    if @color == :black
      '♙'
    else
      '♟'
    end
  end

  def moves
    results = []
    cur_r, cur_c = pos
    new_r = cur_r + dir

    if @board.empty?([new_r, cur_c])
      results << [new_r, cur_c]
      move_two = [new_r + dir, cur_c]
      results << move_two unless @moved || !@board.empty?(move_two)
    end

    diag_left = [new_r, cur_c - 1]
    results << diag_left if @board.in_range?(diag_left) && @board[diag_left].color != @color
    diag_right = [new_r, cur_c + 1]
    results << diag_right if @board.in_range?(diag_right) && @board[diag_right].color != @color
    results
  end

  def dir
    color == :white ? -1 : 1
  end

  def dup
    super
  end
end
