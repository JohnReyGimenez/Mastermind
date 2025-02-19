# frozen_string_literal: true

require 'colorize'

class Board
  COLORS = {
    1 => '  '.colorize(background: :red),
    2 => '  '.colorize(background: :blue),
    3 => '  '.colorize(background: :green),
    4 => '  '.colorize(background: :yellow),
    5 => '  '.colorize(background: :magenta),
    6 => '  '.colorize(background: :cyan)
  }.freeze

  FEEDBACK_SYMBOLS = {
    black: '  '.colorize(background: :black),
    white: '  '.colorize(background: :white)
  }.freeze

  def initialize
    @board = Array.new(8, ' ') # create a board with 8 nil elements
    @secret_code = Array.new(4, ' ')
  end

  def display_instructions
    instructions = <<~HEREDOC
      =============================================
      #{'Welcome to Mastermind!'.colorize(:green)}
      =============================================

      The goal of the game is to guess the secret code or create a code for the computer to guess.

      #{'Roles:'.colorize(:blue)}
      - If you're the #{'code guesser'.colorize(:yellow)}, you have 10 attempts to guess the code.
      - If you're the #{'code maker'.colorize(:yellow)}, the computer will try to guess your code.

      #{'Feedback Rules:'.colorize(:blue)}
      - #{'Black Peg'.colorize(:black)}: Correct color in the correct position.
      - #{'White Peg'.colorize(:white)}: Correct color but in the wrong position.

      #{'How to Play:'.colorize(:blue)}
      - To input your guess or code, use the following format:
        #{'[1] [2] [3] [4]'.colorize(:yellow)}
        Each number represents a color:
          1: #{'Red'.colorize(:red)}
          2: #{'Blue'.colorize(:blue)}
          3: #{'Green'.colorize(:green)}
          4: #{'Yellow'.colorize(:yellow)}
          5: #{'Magenta'.colorize(:magenta)}
          6: #{'Cyan'.colorize(:cyan)}

      #{'Example Guess:'.colorize(:blue)}
      - If you want to guess #{'Red, Blue, Green, Yellow'.colorize(:yellow)}, input:
        #{'1 2 3 4'.colorize(:yellow)}

      #{'Feedback Input:'.colorize(:blue)}
      - To provide feedback, use the following format:
        #{'[1] [2]'.colorize(:yellow)}
        - 1: Represents #{'White Peg'.colorize(:white)}
        - 2: Represents #{'Black Peg'.colorize(:black)}
      #{'Example Feedback:'.colorize(:blue)}
      - If you want to indicate two whites and two blacks, input:
        #{'1 1 2 2'.colorize(:yellow)}

      =============================================
      Good luck, and have fun!
      =============================================
    HEREDOC
    puts instructions
  end

  def display_board(show_secret_code: false)
    clear_screen
    puts 'Color Codes:'
    puts "1: #{'Red'.colorize(:red)} | 2: #{'Blue'.colorize(:blue)} | 3: #{'Green'.colorize(:green)} | 4: #{'Yellow'.colorize(:yellow)} | 5: #{'Magenta'.colorize(:magenta)} | 6: #{'Cyan'.colorize(:cyan)}"

    if show_secret_code
      puts "Secret Code: #{COLORS[@secret_code[0]]} #{COLORS[@secret_code[1]]}
      #{COLORS[@secret_code[2]]} #{COLORS[@secret_code[3]]}"
    end
    puts '+---------+---------------------+'
    puts '|      Guess       |  Feedback  |'
    puts '+---------+---------------------+'
    puts "| #{COLORS[@board[0]]}  #{COLORS[@board[1]]}  #{COLORS[@board[2]]}  #{COLORS[@board[3]]}   | #{feedback_to_colors(@board[4..7])} |"
    puts '+---------+---------------------+'
  end

  def display_code_maker_board(guesses, feedback)
    puts 'Color Codes:'
    puts "1: #{'Red'.colorize(:red)} | 2: #{'Blue'.colorize(:blue)} | 3: #{'Green'.colorize(:green)} | 4: #{'Yellow'.colorize(:yellow)} | 5: #{'Magenta'.colorize(:magenta)} | 6: #{'Cyan'.colorize(:cyan)}"

    puts "\nSecret Code: #{COLORS[@secret_code[0]]} #{COLORS[@secret_code[1]]} #{COLORS[@secret_code[2]]} #{COLORS[@secret_code[3]]}\n\n"

    puts '+---------+---------------------+'
    puts '|    Computer Guess   |  Feedback  |'
    puts '+---------+---------------------+'

    guesses.each_with_index do |guess, index|
      guess_display = guess.map { |num| COLORS[num] }.join(' ')
      feedback_display = feedback[index]&.map { |peg| FEEDBACK_SYMBOLS[peg] || ' ' }&.join(' ') || ''
      puts "| #{guess_display} | #{feedback_display.ljust(7)} |"
    end

    puts '+---------+---------------------+'
  end

  def feedback_to_colors(feedback)
    feedback.map { |peg| FEEDBACK_SYMBOLS[peg] || ' ' }.join(' ').ljust(7)
  end

  def update_cell(index, value)
    @board[index] = value
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def set_secret_code(code)
    @secret_code = code
  end
end
