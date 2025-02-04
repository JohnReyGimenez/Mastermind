# frozen_string_literal: true

require 'colorize'

class Game
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def play_game
    loop do
      board.display_board
      puts "input your code
          1: #{'Red'.colorize(:red)}
          2: #{'Blue'.colorize(:blue)}
          3: #{'Green'.colorize(:green)}
          4: #{'Yellow'.colorize(:yellow)}
          5: #{'Magenta'.colorize(:magenta)}
          6: #{'Cyan'.colorize(:cyan)}"
      user_input = gets.strip
      index = user_input.input_to_index
    end
  end

  def choose_role
    if player == 'guesser'
      'guesser'
    else
      'maker'
    end
  end
end

game = Game.new

game.play_game

# add function to determine if the player has won
# add function to see if the player or computer has ran out of guesses
#
