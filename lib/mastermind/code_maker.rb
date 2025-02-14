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
      @board.display_board
      random_guess while attempts > 5
    end
    @attempts -= 1
  end

  def random_guess
    [*1..6].sample
  end

  def refined_guess
  end

  def get_player_feedback
  end

  def get_player_code
    gets.chomp.to_a
  end
end

#
#
#
