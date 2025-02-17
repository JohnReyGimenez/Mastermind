# frozen_string_literal: true

class CodeMaker
  def initialize(board)
    @board = board
    @attempts = 10
    @previous_guesses = []
    @possible_codes = (1..6).to_a.repeated_permutation(4).to_a # all possible 4 digit codes
    # from num 1 to 6
  end

  def play_as_maker(difficulty = :medium)
    random_guesses = case difficulty
                     when :easy then 6
                     when :medium then 4
                     when :hard then 2
                     end
    @attempts = 10
    secret_code = get_player_code

    while attempts.positive?
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

  def random_guess
    Array.new(4) { rand(1..6) }
  end

  def refined_guess(feedback)
    if feedback.any? { |peg| %i[black white].include?(peg) }
      refine_based_on_feedback
    else
      random_guess
    end
  end

  def refine_based_on_feedback(feedback)
    last_guess = @previous_guesses.last[:guess]
    new_guess = last_guess.dup

    if feedback[0..1].any? { |peg| %i[black white].include?(peg) }
      new_guess[0] = rand(1..6).to_a.reject { |n| n == last_guess[0] }.sample unless feedback[0] == :black
      new_guess[1] = rand(1..6).to_a.reject { |n| n == last_guess[1] }.sample unless feedback[1] == :black
    end

    if feedback[2..3].any? { |peg| %i[black white].include?(peg) }
      new_guess[2] = rand(1..6).to_a.reject { |n| n == last_guess[2] }.sample unless feedback[2] == :black
      new_guess[3] = rand(1..6).to_a.reject { |n| n == last_guess[3] }.sample unless feedback[3] == :black
    end

    feedback.each_with_index do |peg, i|
      if peg == :white
        swap_index = (i + 1) % 4
        new_guess[i], new_guess[swap_index] = new_guess[swap_index], new_guess[i]
      end
    end

    new_guess
  end

  def get_player_feedback(guess)
    loop do
      puts "Provide feedback for the computer's guess (e.g., '1 1 2 2' for two whites and two blacks):"
      feedback = gets.chomp.split.map(&:to_i)
      return feedback.map { |n| n == 1 ? :white : :black } if valid_feedback?(feedback)

      puts 'invalid input please enter 4 numbers (1 for white, 2 for black).'
    end
  end

  def valid_feedback?(feedback)
    feedback.size == 4 && feedback.all? { |n| [1, 2].include?(n) }
  end

  def get_player_code
    loop do
      puts 'Enter your secret code (4 numbers between 1 to 6 seperated by spaces):'
      code = gets.chomp.split.map(&:to_i)
      return code if valid_code?(code)

      puts 'Invalid code please try again'
    end
  end

  def valid_code?(code)
    code.size == 4 && code.all? { |num| num.between?(1, 6) }
  end

  def won?(secret_code, guess)
    guess == secret_code
  end
end
