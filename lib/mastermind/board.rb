# frozen_string_literal: true

class Board
  COLORS = {
    1 => ' 1 '.colorize(:red),
    2 => ' 2 '.colorize(:blue),
    3 => ' 3 '.colorize(:green),
    4 => ' 4 '.colorize(:yellow),
    5 => ' 5 '.colorize(:magenta),
    6 => ' 6 '.colorize(:cyan)
  }.freeze

  def initialize
    @board = Array.new(8, ' ') # create a board with 8 nil elements
  end

  def display_board
    puts " #{COLORS[@board[0]]} #{COLORS[@board[0]]} #{COLORS[@board[1]]} #{COLORS[@board[1]]}
     #{COLORS[@board[2]]} #{COLORS[@board[2]]} #{COLORS[@board[3]]} #{COLORS[@board[3]]}"

    puts " #{COLORS[@board[0]]} #{COLORS[@board[0]]} #{COLORS[@board[1]]} #{COLORS[@board[1]]}
     #{COLORS[@board[2]]} #{COLORS[@board[2]]} #{COLORS[@board[3]]} #{COLORS[@board[3]]}"

    puts '-----------'
    puts "Feedback: #{board[4]} #{board[5]} #{board[6]} #{board[7]}"
  end

  def update_cell(index, _value)
    @board[index] = value
  end
end
