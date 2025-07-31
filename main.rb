# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'game'

player1 = Player.new('Jesse', 'X')
player2 = Player.new('Solomon', 'O')

game = Game.new(player1, player2)

until game.over?
  game.board.display
  puts "it's #{game.current_player.name}'s turn"
  puts 'Enter your move'
  row, col = gets.chomp.split.map(&:to_i)
  game.play_turn(row, col)
end
