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

  def in_range?(pos)
    x, y = pos
    (0...@grid.size).include?(x) && (0...@grid.size).include?(y)
  end

  def all_pos
    indices = (0...@grid.size).to_a
    indices.product(indices)
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
