# frozen_string_literal: true

# Represents the TicTacToe game board, handles move logic and checks for winner
class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, '') }
  end

  # Print's out the game board
  def display
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        print(row_index * 3 + col_index) if cell == ''
        print cell unless cell == ''
        print ' | ' unless col_index == row.size - 1
      end
      puts
      puts '----------' unless row_index == @grid.size - 1
    end
  end

  def make_move(row, col, symbol)
    @grid[row][col] = symbol
  end

  # Checks if there's a winner
  def winner?
    return false unless horizontal_win? || vertical_win?

    puts 'We have a winner'
    true
  end

  # checks if a move is valid
  def valid_move?(row, col)
    @grid[row][col] == ''
  end

  # checks the board for horizontal wins
  def horizontal_win?
    @grid.any? { |row| row.all? { |cell| cell != '' } }
  end

  # checks the board for vertical wins
  def vertical_win?
    if (
      @grid[0][0] != '' && @grid[0][0] == @grid[1][0] &&
      @grid[0][0] == @grid[2][0]) ||
       (@grid[0][1] != '' && @grid[0][1] == @grid[1][1] &&
        @grid[0][1] == @grid[2][1]) || (@grid[0][2] != '' && @grid[0][2] == @grid[1][2] && @grid[0][2] == @grid[2][2])
      true
    end
  end

  # Checks if all cells of the board are filled up
  def full?
    @grid.all? { |row| row.all? { |cell| cell != '' } }
  end
end
