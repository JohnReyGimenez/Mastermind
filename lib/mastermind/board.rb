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

  def initialize
    @board = Array.new(8, ' ') # create a board with 8 nil elements
  end

  def display_board
    puts " #{COLORS[@board[0]]} #{COLORS[@board[1]]} #{COLORS[@board[2]]} #{COLORS[@board[3]]}"
    puts ' -----------'
    puts "Feedback: #{@board[4]} #{@board[5]} #{@board[6]} #{@board[7]}"
  end

  def update_cell(index, value)
    @board[index] = value
  end
end

board = Board.new

board.update_cell(0, 1) # Red
board.update_cell(1, 2) # Blue
board.update_cell(2, 3) # Green
board.update_cell(3, 4) # Yellow

board.display_board
