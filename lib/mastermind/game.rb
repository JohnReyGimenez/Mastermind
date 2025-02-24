# frozen_string_literal: true

require 'colorize'

class Game
  # this class manages the game loop and player roles
  def initialize(board)
    @board = board
    @code_guesser = CodeGuesser.new(@board)
    @code_maker = CodeMaker.new(@board)
  end

  def input_to_index(user_input)
    user_input.split.map(&:to_i)
  end

  def play_game
    loop do
      role = choose_role

      if role == 'guesser'
        @code_guesser.play_as_guesser
      else
        @code_maker.play_as_maker
      end

      puts 'do you wanna play again? (yes/no)'
      play_again = gets.chomp.downcase
      until %w[yes no].include?(play_again)
        puts 'Invalid Input. enter "yes" or "no".'
        play_again =  gets.chomp.downcase
      end
      break if play_again == 'no'
    end
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
