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
    end
  end
end
