# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'game'

player1 = Player.new('Jesse', 'X')
player2 = Player.new('Solomon', 'O')

game = Game.new(player1, player2)

game.play_round
