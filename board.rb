require_relative 'pieces.rb'

class Board
  def initialize(fill = true)
    @grid = Array.new(8) {Array.new(8) { NullPiece.instance }}
    populate_grid if fill
  end


  def move(start, end_pos)
    if self[start].valid_move?(end_pos)
      move!(start, end_pos)
    else
      raise StandardError.new("BAD MOVE")
    end
  end

  def move!(start, end_pos)
    piece = self[start]
    piece.pos = end_pos
    self[end_pos] = piece
    self[start] = NullPiece.instance
  end

  def populate_grid
    place_pieces(:white)
    place_pieces(:black)
  end

  def place_piece(pos, piece_type, color)
    self[pos] = piece_type.new(self, pos, color)
  end

  def place_pieces(color)
    place_pawns(color)
    place_base_row(color)
  end

  def place_pawns(color)
    color == :black ? row = 1 : row = 6
    @grid[row].each_index do |col|
      place_piece([row, col], Pawn, color)
    end
  end

  def place_base_row(color)
    color == :black ? row = 0 : row = 7
    #rooks
    [0,7].each { |col| place_piece([row,col], Rook, color) }
    #knights
    [1,6].each { |col| place_piece([row,col], Knight, color)}
    #bishops
    [2,5].each { |col| place_piece([row,col], Bishop, color) }
    #Queen
    place_piece([row,3], Queen, color)
    #k
    place_piece([row,4], King, color)
  end

  def rows
    @grid
  end

  def checkmate?
    false
  end
  def in_range?(pos)
    x, y = pos
    (0...@grid.size).include?(x) && (0...@grid.size).include?(y)
  end

  def all_pos
    indices = (0...@grid.size).to_a
    indices.product(indices)
  end

  def empty?(pos)
    self[pos] == NullPiece.instance
  end
  # private
  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row,col = pos
    @grid[row][col] = piece
  end

  def populate(num = 12)
    all_pos.shuffle.take(num).each do |row,col|
      self[[row,col]] = Queen.new(self, [row,col], :black)
    end
  end
end
