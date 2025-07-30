require_relative 'board'
require_relative 'player'

# Game class
class Game
  attr_reader(:board, :current_player)

  def initialize(player1, player2)
    @board = Board.new
    @score = { x: 0, y: 0 }
    @player1 = player1
    @player2 = player2

    @current_player = @player1
  end

  def play_turn(row, column)
    @board.make_move(row, column, @current_player.symbol)
    @current_player = if @current_player == @player1
                        @player2
                      else
                        @player1
                      end
  end

  def over?
    @board.winner? || @board.is_full?
  end
end
