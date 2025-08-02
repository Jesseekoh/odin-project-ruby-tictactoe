# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# Game class
class Game
  attr_reader(:board, :current_player)

  def initialize(player1, player2)
    @board = Board.new
    @score = { X: 0, O: 0 }
    @player1 = player1
    @player2 = player2

    @current_player = @player1
  end

  def update_score
    winner = @board.horizontal_win? || @board.vertical_win? || @board.diagonal_win?

    puts "#{winner} wins this round"
    return if winner.nil?

    @score[winner.to_sym] += 1
  end

  def play_round
    @board.display
    until round_over?
      puts "it's #{current_player.name}'s turn"
      puts 'Enter your move'
      row, col = gets.chomp.split.map(&:to_i)
      play_turn(row, col)
      @board.display
    end
    update_score
    puts @score

    repeat_round
  end

  def repeat_round
    puts 'Do you want to play another round?'
    return unless gets.chomp[0].downcase == 'y'

    @board.clear
    play_round
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

  def round_over?
    @board.winner? || @board.full?
  end
end
