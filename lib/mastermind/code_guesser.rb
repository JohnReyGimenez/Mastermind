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

      update_guess(guess) if valid_move?

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
end
# function - if player has chosen code guesser return true
# codeguesser game function - main loop for code guesser
