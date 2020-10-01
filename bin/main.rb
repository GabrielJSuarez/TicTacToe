#!/usr/bin/env ruby

# Board

class Display
  def board (board)
    puts (board.map { |x| x.join(' | ') })
  end
end

class Players 

end

board = [
  ['-', '-', '-'],
  ['-', '-', '-'],
  ['-', '-', '-']
]

first_board = Display.new
first_board.board(board)

# puts(board.map { |x| x.join(' | ') })

game_status = true
moves_left = 9

while game_status
 

  puts 'player 1 choose position: '
  puts 'player 1 choose line'
  player_1_row = gets.chomp 
  puts 'player 1 choose column'
  player_1_column = gets.chomp

  if (player_1_row <= "2" && player_1_row >= "0") && (player_1_column <= "2" && player_1_column >= "0")
    if board[player_1_row.to_i][player_1_column.to_i] == '-'
      board[player_1_row.to_i][player_1_column.to_i] = 'x'
      moves_left -= 1
    else
      puts 'space already fill'
    end
  else
    puts "not a valid position, try again!"
  end  

  first_board.board(board)



  winning_move_1_p1 = board[player_1_row.to_i].all?("x")

  winning_move_2_p1 = [board[0][player_1_column.to_i], board[1][player_1_column.to_i], board[2][player_1_column.to_i]].all?("x")

  winning_move_3_p1 = [board[0][0], board[1][1], board[2][2]].all?("x")

  winning_move_4_p1 = [board[0][2], board[1][1], board[2][0]].all?("x")

  if winning_move_1_p1 || winning_move_2_p1 || winning_move_3_p1 || winning_move_4_p1
    puts "Winner!"
    game_status = false
    break
  elsif moves_left == 0
    puts "The game is a Draw!"
    game_status = false
    break
  else
    puts "Next player's turn"
  end
  

  # CHANGE OF PLAYERS

  puts 'player 2 choose position: '
  puts 'player 2 choose line'
  player_2_row = gets.chomp
  puts 'player 2 choose column'
  player_2_column = gets.chomp

  if (player_2_row <= "2" && player_2_row >= "0") && (player_2_column <= "2" && player_2_column >= "0")
    if board[player_2_row.to_i][player_2_column.to_i] == '-'
      board[player_2_row.to_i][player_2_column.to_i] = 'o'
      moves_left -= 1
    else
      puts 'space already fill'
    end
  else
    puts "not a valid position, try again!"
  end  

  puts(board.map { |x| x.join(' | ') })

  winning_move_1_p2 = board[player_2_row.to_i].all?("o")

  winning_move_2_p2 = [board[0][player_2_column.to_i], board[1][player_2_column.to_i], board[2][player_2_column.to_i]].all?("o")

  winning_move_3_p2 = [board[0][0], board[1][1], board[2][2]].all?("o")

  winning_move_4_p2 = [board[0][2], board[1][1], board[2][0]].all?("o")

  if winning_move_1_p2 || winning_move_2_p2 || winning_move_3_p2 || winning_move_4_p2
    puts "Winner!"
    game_status = false
    break
  elsif moves_left == 0
    puts "The game is a Draw!"
    game_status = false
    break
  else
    puts "Next player's turn"
  end

end
