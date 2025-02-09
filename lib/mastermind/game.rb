# frozen_string_literal: true

require 'colorize'

class Game
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
    puts "input your code
          1: #{'Red'.colorize(:red)}
          2: #{'Blue'.colorize(:blue)}
          3: #{'Green'.colorize(:green)}
          4: #{'Yellow'.colorize(:yellow)}
          5: #{'Magenta'.colorize(:magenta)}
          6: #{'Cyan'.colorize(:cyan)}"
    user_input = gets.strip
    guess = input_to_index(user_input)
  end

  def choose_role
    puts 'Choose your role: (guesser/maker)'
    role = gets.chomp.downcase
    until [guesser, maker].include?(role)
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
