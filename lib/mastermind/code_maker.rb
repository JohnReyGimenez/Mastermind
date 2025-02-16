# frozen_string_literal: true

class CodeMaker
  def initialize
    @board = board
    @attempts = 10
    @previous_guesses = []
    @possible_codes = (1..6).to_a.repeated_permutation(4).to_a # array of all possible 4 digit codes
    # from num 1 to 6
  end

  def play_as_maker
    @attempts = 10
    secret_code = get_player_code

    while attempts.positive?
      guess = if @previous_guesses < 5
                random_guess
              else
                refine_based_on_feedback
              end
      @board.display_board
      random_guess while attempts > 5
    end
    @attempts -= 1
  end

  def random_guess
    Array.new(4) { rand(1..6) }
  end

  def refined_guess(feedback)
  end

  def refine_based_on_feedback(feedback)
  end

  def get_player_feedback
  end

  def get_player_code
    loop do
      puts 'Enter your secret code (4 numbers between 1 to 6 seperated by spaces):'
      code = gets.chomp.split.map { |num| num.to_i }
      return code if valid_code?(code)

      puts 'Invalid code please try again'
    end
  end

  def valid_code?(code)
    code.size == 4 && code.all? { |num| num.between?(1, 6) }
  end

  def won?
    computer_code = secret_code
  end
end

#
#
#
