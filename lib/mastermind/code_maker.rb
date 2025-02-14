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
  end

  def get_player_feedback
  end
end

#
#
#
