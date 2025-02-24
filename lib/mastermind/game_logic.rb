# frozen_string_literal: true

module GameLogic
  # this module manages the shared logic for generating feedback and refining guesses
  def refine_based_on_feedback(feedback)
    last_guess = @guess_history.last[:guess]
    new_guess = last_guess.dup

    feedback.each_with_index do |peg, i|
      if peg == :black
        # keep correct color
        next
      elsif peg == :white
        # swap with different position
        swap_index = find_swap_index(new_guess, i)
        new_guess[i], new_guess[swap_index] = new_guess[swap_index], new_guess[i]
      else
        # tries new color for current position
        new_guess[i] = generate_new_color(new_guess, i)
      end
    end

    new_guess
  end

  def find_swap_index(guess, current_index)
    # finds next index if isnt correct
    (current_index + 1..guess.size).find do |i|
      guess[i] != @secret_code[i]
    end || 0
    # go back to 0 if no valid index is found
  end

  def generate_new_color(guess, current_index)
    available_colors = (1..6).to_a - [guess[current_index]]
    available_colors.sample
  end

  def generate_feedback(secret_code, guess)
    # creates nested array of pairs from the secret code  and the guess
    # counts how many pairs are exact matches
    exact_matches = secret_code.zip(guess).count { |s, g| s == g }

    # counts correct colors in wrong positions
    secret_counts = secret_code.each_with_object(Hash.new(0)) { |num, hash| hash[num] += 1 }
    guess_counts = guess.each_with_object(Hash.new(0)) { |num, hash| hash[num] += 1 }

    correct_colors = secret_counts.sum { |num, count| [count, guess_counts[num]].min } - exact_matches

    # creates am array of of feedback symbols
    [:black] * exact_matches + [:white] * correct_colors
  end

  def update_guess(guess)
    guess.each_with_index do |value, index|
      @board.update_cell(index, value)
    end
  end

  def update_feedback(feedback)
    feedback.each_with_index do |value, index|
      @board.update_cell(index + 4, value)
    end
  end
end
