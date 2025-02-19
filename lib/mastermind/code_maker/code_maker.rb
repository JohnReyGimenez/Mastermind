# frozen_string_literal: true

class CodeMaker
  def initialize(board)
    @board = board
    @attempts = 10
    @guess_history = []
    @feedback_history = []
  end

  def play_as_maker
    difficulty = PlayerInput.choose_difficulty
    secret_code = PlayerInput.get_player_code
    @board.set_secret_code(secret_code) # Set the secret code on the board
    @board.display_board(show_secret_code: true)
    guesser = ComputerGuesser.new(difficulty)

    while @attempts.positive?
      play_turn(guesser, secret_code)

      # checks if computer correctly guessed the code
      if won?(secret_code, @previous_guesses.last[:feedback])
        puts "the computer guess your code! #{guess.join(' ')}"
        return
      end

      @attempts -= 1
      puts "Remaining attempts: #{@attempts}"
    end
    puts 'the computer has failed in guessing your secret code. You win!!'
  end

  def play_turn(guesser, _secret_code)
    # generate computers next code
    guess = guesser.next_guess(@previous_guesses)
    puts "Computers guess: #{guess.join(' ')}"

    # gets feedback from player
    feedback = PlayerInput.get_player_feedback
    @previous_guesses << { guess: guess, feedback: feedback }
    @feedback_history << feedback

    # updates the board
    guess.each_with_index { |value, index| @board.update_cell(index, value) }
    (0..4).each { |i| @board.update_cell(i + 4, feedback[i] || ' ') }

    @board.display_code_maker_board(@guess_history.map { |g| g[:guess] }, @feedback_history)
  end

  def won?(secret_code, guess)
    guess == secret_code
  end
end
