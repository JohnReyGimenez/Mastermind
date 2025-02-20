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
    guesser = ComputerGuesser.new(difficulty)

    while @attempts.positive?
      play_turn(guesser, secret_code)

      # checks if computer correctly guessed the code
      if won?(secret_code, @guess_history.last[:guess])
        puts "the computer guess your code! #{@guess_history.last[:guess].join(' ')}"
        return
      end

      @attempts -= 1
      puts "Remaining attempts: #{@attempts}"
    end
    puts 'the computer has failed in guessing your secret code. You win!!'
  end

  def play_turn(guesser, _secret_code)
    @board.display_code_maker_board(@guess_history.map { |g| g[:guess] }, @feedback_history)

    # generate computers next code
    guess = guesser.next_guess(@guess_history)
    puts "Computers guess: #{guess.join(' ')}"

    # gets feedback from player
    feedback = PlayerInput.get_player_feedback
    @guess_history << { guess: guess, feedback: feedback }
    @feedback_history << feedback

    # updates the board
    update_board_with_guess_and_feedback(guess, feedback)

    @board.display_code_maker_board(@guess_history.map { |g| g[:guess] }, @feedback_history)
  end

  def update_board_with_guess_and_feedback(guess, feedback)
    # updtates guess cells
    guess.each_with_index do |value, index|
      @board.update_cell(index, value)
    end

    # updates feedback cells
    feedback.each_with_index do |value, index|
      @board.update_cell(index + 4, value)
    end
  end

  def won?(secret_code, guess)
    guess == secret_code
  end
end
