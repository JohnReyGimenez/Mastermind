# frozen_string_literal: true

class CodeGuesser
  def initialize
    @board = board
  end

  def play_as_guesser
    secret_code = Random.new.rand(1..6)
    attempts = 10

    while attempts.positive?
      board.display_board
      puts 'Enter your guess(4 numbers between 1 and 6, separated by spaces):'
      user_input = gets.chomp
      guess = input_to_index(user_input)

      if valid_move?(guess)
        update_guess(guess)
        feedback = generate_feedback(secret_code, guess)
        @board.update_cell(4, feedback[0])
        @board.update_cell(5, feedback[1])
        @board.update_cell(6, feedback[2])
        @board.update_cell(7, feedback[3])
      end

      if guess == secret_code
        puts 'you guessed the code!'
        return
      end

      attempts -= 1
      puts "attempts remaining: #{attempts}"
    end

    puts "you have ran out of guesses, the secret code was #{secret_code.join(' ')}"
  end

  def update_guess(guess)
    guess.each_with_index do |value, index|
      board.update_cell(index, value)
    end
  end

  def valid_move?(guess)
    return unless guess.size == 4

    guess.all? { |num| num.between?(1, 6) } # checks if guess is between 1 and 6
  end

  def generate_feedback(secret_code, guess)
    # creates nested array of pairs from the secret code  and the guess
    exact_matches = secret_code.zip(guess).count { |s, g| s == g } # counts how many pairs are exact matches
    correct_colors = (secret_code & guess).size - exact_matches # gives exact number of correct colors in wrong position
    [:black] * exact_matches + [:white] * correct_colors # creates am array of of feedback symbols
  end
end
