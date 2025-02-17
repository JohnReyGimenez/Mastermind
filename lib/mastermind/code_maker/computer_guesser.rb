# frozen_string_literal: true

Class ComputerGuesses
def initialize(difficulty)
  @difficulty = difficulty
  @random_guesses = case difficulty
                    when :easy then 6
                    when :medium then 4
                    when :hard then 2
                    end
  @previous_guesses = []
end

def next_guess(previous_guesses)
  if previous_guesses.size < @random_guesses
    random_guess
  else
    refine_based_on_feedback(previous_guesses.last[:feedback])
  end
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
