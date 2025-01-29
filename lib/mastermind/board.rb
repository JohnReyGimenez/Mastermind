Class Board
  COLORS = {
    1 => " 1 ".colorize(:red),
    2 => " 2 ".colorize(:blue),
    3 => " 3 ".colorize(:green),
    4 => " 4 ".colorize(:yellow),
    5 => " 5 ".colorize(:magenta),
    6 => " 6 ".colorize(:cyan),
    }

  def initialize
    @board = Array.new(8, " ") #create a board with 8 nil elements
  end

  def display_board()
    puts " #{board[0]} #{board[0]}  #{board[1]} #{board[1]} #{board[2]} #{board[2]} #{board[3]} #{board[3]} "
    puts " #{board[0]} #{board[0]}  #{board[1]} #{board[1]} #{board[2]} #{board[2]} #{board[3]} #{board[3]} "
    puts "-----------"
    puts "Feedback: #{board[4]} #{board[5]} #{board[6]} #{board[7]}"
  end

  
end