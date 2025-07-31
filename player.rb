# frozen_string_literal: true

# Represents a TikTacToe Player
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
