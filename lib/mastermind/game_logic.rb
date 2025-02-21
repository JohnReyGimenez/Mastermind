module GameLogic
  def refine_based_on_feedback(feedback)
    last_guess = @guess_history.last[:guess]
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
