class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end

  def display
    @grid.each { |row| puts row.join('|') }
  end

  def make_move(row, col, symbol)
    @grid[row][col] = symbol
  end

  def winner?
    # check horizontal
    if horizontal_win?
      puts 'A row has a winner'
    elsif vertical_win
      puts 'There is a vertical winner'
    end
  end

  def horizontal_win?
    @grid.any? { |row| row.all? { |cell| cell != '_' } }
  end

  def vertical_win
    @grid[0][0] != '' && @grid[0][0] == @grid[1][0] && @grid[0][0] == @grid[2][0]
  end

  def is_full?
    @grid.all? { |row| row.all? { |cell| cell != '_' } }
  end
end
