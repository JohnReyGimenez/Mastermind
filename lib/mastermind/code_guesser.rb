# frozen_string_literal: true

class CodeGuesser
  def play_as_guesser
    secret_code = Random.new.rand(1..6)
    attempts = 10

    while attempts > 0
      board.display_board
      puts 'Enter your guess(4 numbers between 1 and 6, separated by spaces):'
      user_input = gets.chomp
      guess = input_to_index(user_input)
    end
  end

  def update_guess(guess)
    guess.each_with_index do |value, index|
      board.update_cell(index, value)
    end
  end
end

# function - if player has chosen code guesser return true
# codeguesser game function - main loop for code guesser
