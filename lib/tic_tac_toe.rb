class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0, 1, 2], #top_row_win
  [3, 4, 5], #middle_row_win
  [6, 7, 8], #bottom_row_win
  [0, 3, 6], #left_column_win
  [1, 4, 7], #middle_column_win
  [2, 5, 8], #right_column_win
  [0, 4, 8], #left_diagonal_win
  [2, 4, 6] #right_diagonal_win
]

def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(board, index)
  @board[index] == "X" || @board[index] == "O")
  true
else
  false
end
end

def valid_move?(board,index)
if index.between?(0, 8) && !position_taken?(board,index)
  return true
else index > 9 || position_taken?(board,index)
  return nil
end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board,index, current_player(board))
    display_board(board)
  else
    turn(board)
end
end


def turn_count(board)
  counter = 0
  board.each do |move|
    if move == "X" || move == "O"
      then counter += 1
end
end
return counter
end


def current_player(board)
if turn_count(board) % 2 != 0
  "O"
else
  "X"
end
end


def won?(board)
  WIN_COMBINATIONS.each do |winning|
    win_x = winning.all? do |index|
      board[index] == "X"
    end
    win_o = winning.all? do |index|
      board[index] == "O"
    end
    if win_x || win_o
      return winning
    end
  end
  false
end

def full?(board)
!board.find{|i| i == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  if full?(board) || won?(board)
    return true
  end
  false
end

def winner(board)
  done = won?(board)
  if done
    board[done[0]]
  else
    nil
  end
end

def play(board)
until over?(board) || draw?(board)
  current_player(board)
  turn(board)
end
if won?(board)
  puts "Congratulations #{winner(board)}!"
else draw?(board) == true
  puts "Cat's Game!"
end
end

end
