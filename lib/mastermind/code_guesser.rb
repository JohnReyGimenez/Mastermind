# frozen_string_literal: true

class CodeGuesser
  def play_as_guesser
    secret_code = Random.new.rand(1..6)
    attempts = 10

    while attempts > 0
      board.display_board
      puts 'Enter your guess:'
    end
  end

  def update_guess(guess)
  end
end

# function - if player has chosen code guesser return true
# codeguesser game function - main loop for code guesser
