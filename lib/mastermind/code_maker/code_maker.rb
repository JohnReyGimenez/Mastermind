# frozen_string_literal: true

class CodeMaker
  def initialize(board)
    @board = board
    @attempts = 10
    @previous_guesses = []
  end

  def play_as_maker
    difficulty = PlayerInput.choose_difficulty
    secret_code = PlayerInput.get_player_code
    @board.set_secret_code(secret_code) # Set the secret code on the board
    guesser = ComputerGuesser.new(difficulty)

    while @attempts.positive?
      play_turn(guesser, secret_code)

      # checks if computer correctly guessed the code
      if won?(secret_code, previous_guesses.last[:feedback])
        puts "the computer guess your code! #{guess.join(' ')}"
        return
      end

      @attempts -= 1
      puts "Remaining attempts: #{@attempts}"
    end
    puts 'the computer has failed in guessing your secret code. You win!!'
  end

  def play_turn(guesser, secret_code)
    # generate computers next code
    guess = guesser.next_guess(@previous_guesses)
    puts "Computers guess: #{guess.join(' ')}"

    # gets feedback from player
    feedback = get_player_feedback(guess)
    @previous_guesses << { guess: guess, feedback: feedback }

    # updates the board
    guess.each_with_index { |value, index| @board.update_cell(index, value) }
    feedback.each_with_index { |value, index| @board.update_cell(index, value) }

    @board.display_board(show_secret_code: true)
  end

  def won?(secret_code, guess)
    guess == secret_code
  end
end
