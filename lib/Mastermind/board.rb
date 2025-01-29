Class Board
  def initialize
    @board = Array.new(8, " ") #create a board with 8 nil elements
  end

  def display_board()
    puts " #{board[0]} #{board[0]}  ##{board[1]} ##{board[1]}  ##{board[2]} ##{board[2]}  ##{board[3]} ##{board[0]} ##{board[0]} ##{board[0]}"
    puts " #{board[0]} #{board[0]}}  ##{board[1]} ##{board[1]} ##{board[2]} ##{board[2]} ##{board[3]} ##{board[0]} ##{board[0]} ##{board[0]}"

  end


end