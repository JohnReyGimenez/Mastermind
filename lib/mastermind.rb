# frozen_string_literal: true

require_relative 'mastermind/board'
require_relative 'mastermind/code_guesser'
require_relative 'mastermind/code_maker/code_maker'
require_relative 'mastermind/code_maker/computer_guesser'
require_relative 'mastermind/code_maker/player_input'
require_relative 'mastermind/game'

require 'colorize'

board = Board.new
game = Game.new(board)

board.display_instructions

game.play_game
