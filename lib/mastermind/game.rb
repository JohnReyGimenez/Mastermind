# frozen_string_literal: true

require 'colorize'

class Game
  def initialize
    @board = board
  end

  def input_to_index(user_input)
    user_input.split.map(&:to_i)
  end

  def play_game
    role = choose_role
    return unless role == 'guesser'

    play_as_guesser
  end
  loop do
    board.display_board
    role = choose_role

    @CodeGuesser.play_as_guesser if role == 'guesser'

    user_input = gets.strip
    guess = input_to_index(user_input)
  end

  def choose_role
    puts 'Choose your role: (guesser/maker)'
    role = gets.chomp.downcase
    until %w[guesser maker].include?(role)
      puts 'invalid choice. please enter "guesser" or "maker".'
      role = gets.chomp.downcase
    end
    role
  end
end

game = Game.new

game.play_game

# add function to determine if the player has won
# add function to see if the player or computer has ran out of guesses
#
