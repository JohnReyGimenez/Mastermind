# frozen_string_literal: true

require_relative 'game_logic'

class CodeGuesser
  # this class manages the code guesser role
  include GameLogic

  def initialize(board)
    @board = board
  end

  def play_as_guesser
    secret_code = (1..6).to_a.shuffle.take(4)
    attempts = 10

    while attempts.positive?
      @board.display_board
      puts "attempts remaining: #{attempts}"
      puts 'Enter your guess(4 numbers between 1 and 6, separated by spaces):'

      # gets user input
      guess = get_valid_guess
      next unless guess # skip if guess is invalid

      update_guess(guess)

      # generates feedback and updates board
      feedback = generate_feedback(secret_code, guess)
      update_feedback(feedback)

      if guess == secret_code
        puts 'you guessed the code!'
        return
      end

      attempts -= 1
    end

    puts "you have ran out of guesses, the secret code was #{secret_code.join(' ')}"
  end

  def get_valid_guess
    loop do
      user_input = gets.chomp
      guess = input_to_index(user_input)
      return guess if valid_move?(guess)

      puts 'Invalid input. Please enter 4 numbers between 1 and 6, separated by spaces.'
    end
  end

  def valid_move?(guess)
    # checks if guess is between 1 and 6 and ensures all numbers are not repeating
    guess.size == 4 && guess.all? { |num| num.between?(1, 6) } && guess.uniq.size == 4
  end

  def input_to_index(input)
    input.split.map(&:to_i)
  end
end
