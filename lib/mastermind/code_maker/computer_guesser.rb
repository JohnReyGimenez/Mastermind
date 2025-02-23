# frozen_string_literal: true

class ComputerGuesser
  def initialize(difficulty)
    @difficulty = difficulty
    @random_guesses = case difficulty
                      when :easy then 6
                      when :medium then 4
                      when :hard then 2
                      end
    @guess_history = []
  end

  def next_guess(previous_guesses)
    if @guess_history.size < @random_guesses
      random_guess
    else
      refine_based_on_feedback(previous_guesses.last[:feedback])
    end
  end

  def random_guess
    (1..6).to_a.sample(4)
  end

  def refined_guess(feedback)
    if feedback.any? { |peg| %i[black white].include?(peg) }
      refine_based_on_feedback
    else
      random_guess
    end
  end
end
