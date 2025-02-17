# frozen_string_literal: true

class CodeMaker
  def initialize(board)
    @board = board
    @attempts = 10
    @previous_guesses = []
  end

  def play_as_maker(difficulty = :medium)
    difficulty = PlayerInput.choose_difficulty
    secret_code = PlayerInput.get_player_code
    @board.set_secret_code(secret_code) # Set the secret code on the board
    guesser = ComputerGuesser.new(difficulty)

    while @attempts.positive?
      guess = if @previous_guesses.size < random_guesses
                random_guess
              else
                refine_based_on_feedback(@previous_guesses.last[:feedback])
              end
      puts "Computers guess: #{guess.join(' ')}"
      feedback = get_player_feedback(guess)
      @previous_guesses << { guess: guess, feedback: feedback }

      # updates the board
      guess.each_with_index { |value, index| @board.update_cell(index, value) }
      feedback.each_with_index { |value, index| @board.update_cell(index, value) }

      clear_screen
      @board.display_board(show_secret_code: true)

      if won?(secret_code, guess)
        puts "the computer guess your code! #{guess.join(' ')}"
        return
      end

      @attempts -= 1
      puts "Remaining attempts: #{@attempts}"
    end
    puts 'the computer has failed in guessing your secret code. You win!!'
  end

  def won?(secret_code, guess)
    guess == secret_code
  end
end
