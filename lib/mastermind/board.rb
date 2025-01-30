# frozen_string_literal: true

require 'colorize'

class Board
  COLORS = {
    1 => '  '.colorize(background: :red),
    2 => '  '.colorize(background: :blue),
    3 => '  '.colorize(background: :green),
    4 => '  '.colorize(background: :yellow),
    5 => '  '.colorize(background: :white),
    6 => '  '.colorize(background: :black),
    7 => '  '.colorize(background: :white),
    8 => '  '.colorize(background: :black)
  }.freeze

  def initialize
    @board = Array.new(8, ' ') # create a board with 8 nil elements
  end

  def display_board
    puts " #{COLORS[@board[0]]} #{COLORS[@board[1]]} #{COLORS[@board[2]]} #{COLORS[@board[3]]}"
    puts ' -----------'
    puts "Feedback: #{COLORS[@board[4]]} #{COLORS[@board[5]]} #{COLORS[@board[6]]} #{COLORS[@board[7]]}"
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
board.update_cell(4, 5)
board.update_cell(5, 6)
board.update_cell(6, 7)
board.update_cell(7, 8)

board.display_board
