# frozen_string_literal: true

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
    if @board.valid_move?(row, column)
      @board.make_move(row, column, @current_player.symbol)
      @current_player = if @current_player == @player1
                          @player2
                        else
                          @player1
                        end
    else
      puts 'Enter a valid move'
    end
  end

  def over?
    @board.winner? || @board.full?
  end
end
