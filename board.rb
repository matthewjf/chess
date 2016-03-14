class Board
  def initialize
    @grid = Array.new(8) {Array.new(8)}

  end


  def move(start, end_pos)

    self[*end_pos] = self[*start]
    self[*start] = EmptySpace.new
    unless valid_move?
      raise StandardError.new("BAD MOVE")
    end
  end

  private
  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row,col = pos
    @grid[row][col] = piece
  end
end
