# frozen_string_literal: true

class CodeGuesser
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

  def update_guess(guess)
    guess.each_with_index do |value, index|
      @board.update_cell(index, value)
    end
  end

  def update_feedback
    feedback.each_with_index do |value, index|
      @board.update_cell(index + 4, value)
    end
  end

  def valid_move?(guess)
    guess.size == 4 && guess.all? { |num| num.between?(1, 6) } # checks if guess is between 1 and 6
  end

  def generate_feedback(secret_code, guess)
    # creates nested array of pairs from the secret code  and the guess
    exact_matches = secret_code.zip(guess).count { |s, g| s == g } # counts how many pairs are exact matches
    correct_colors = (secret_code & guess).size - exact_matches # gives exact number of correct colors in wrong position
    [:black] * exact_matches + [:white] * correct_colors # creates am array of of feedback symbols
  end

  def input_to_index(input)
    input.split.map(&:to_i)
  end
end
