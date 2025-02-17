module PlayerInput
  def self.get_player_feedback(guess)
    loop do
      puts "Provide feedback for the computer's guess (e.g., '1 1 2 2' for two whites and two blacks):"
      feedback = gets.chomp.split.map(&:to_i)
      return feedback.map { |n| n == 1 ? :white : :black } if valid_feedback?(feedback)

      puts 'invalid input please enter 4 numbers (1 for white, 2 for black).'
    end
  end

  def self.valid_feedback?(feedback)
    feedback.size <= 4 && feedback.all? { |n| [1, 2].include?(n) }
  end

  def self.get_player_code
    loop do
      puts 'Enter your secret code (4 numbers between 1 to 6 seperated by spaces):'
      code = gets.chomp.split.map(&:to_i)
      return code if valid_code?(code)

      puts 'Invalid code please try again'
    end
  end

  def self.valid_code?(code)
    code.size == 4 && code.all? { |num| num.between?(1, 6) }
  end

  def self.choose_difficuly
    puts 'Choose difficulty (easy, medium, hard):'
    difficulty = gets.chomp.downcase.to_sym
    puts 'Invalid choice. Enter "easy", "medium", or "hard"' until %i[easy medium hard].include?(difficulty)
    difficulty
  end
end
