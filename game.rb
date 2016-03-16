require 'byebug'
require_relative 'board'
require_relative 'display'
require_relative 'player'
class Game
  include Cursorable

  def initialize
    @board = Board.new

    @player1 = HumanPlayer.new("player1", @board, :white)
    @player2 = HumanPlayer.new("player2", @board, :black)
    @current_player = @player1
  end

  def play
    until game_over?
      play_turn
      switch_player!
    end
  end

  def play_turn
    start = @current_player.get_move
    end_pos = @current_player.get_move
    unless @board[start].color == @current_player.color
      raise ArgumentError.new("that's not yo piece!")
    end
    @board.move(start, end_pos)
    rescue ArgumentError => e
      puts e.message
      retry
  end

  def game_over?
    @board.checkmate?
  end

  def switch_player!
    @current_player = (@current_player == @player1 ? @player2 : @player1)
  end

end

if __FILE__==$0
  Game.new.play
end
