# frozen_string_literal: true

# Represents the TicTacToe game board, handles move logic and checks for winner
class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, nil) }
  end

  # rubocop:disable Metrics/AbcSize
  # Print's out the game board
  def display
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        print(row_index * 3 + col_index) if cell.nil?
        print cell unless cell.nil?
        print '  |' unless col_index == row.size - 1
      end
      puts
      puts '---+---+---' unless row_index == @grid.size - 1
    end
  end
  # rubocop:enable Metrics/AbcSize

  def make_move(row, col, symbol)
    @grid[row][col] = symbol
  end

  # checks if a move is valid
  def valid_move?(row, col)
    @grid[row][col].nil?
  end

  # Checks if there's a winner
  def winner?
    return false unless horizontal_win? || vertical_win? || diagonal_win?

    winner = horizontal_win? || vertical_win? || diagonal_win?

    puts "#{winner} wins this round"
    true
  end

  # checks the board for horizontal wins
  def horizontal_win?
    (0..2).any? do |row|
      return @grid[row][0] if !@grid[row][0].nil? &&
                              @grid[row][0] == @grid[row][1] &&
                              @grid[row][0] == @grid[row][2]
    end
    nil
  end

  # checks the board for vertical wins
  def vertical_win?
    (0..2).any? do |col|
      return @grid[0][col] if !@grid[0][col].nil? &&
                              @grid[0][col] == @grid[1][col] &&
                              @grid[0][col] == @grid[2][col]
    end
    nil
  end

  # checks the board for diagonal wins
  def diagonal_win?
    return @grid[1][1] if !@grid[1][1].nil? && (
                          (@grid[1][1] == @grid[0][0] &&
                          @grid[1][1] == @grid[2][2]) || (@grid[1][1] == @grid[0][2] && @grid[2][0] == @grid[1][1]))

    nil
  end

  # clears the game board
  def clear
    @grid = Array.new(3) { Array.new(3) }
  end

  # Checks if all cells of the board are filled up
  def full?
    @grid.all? { |row| row.all? { |cell| !cell.nil? } }
  end
end
