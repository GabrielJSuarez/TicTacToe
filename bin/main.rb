#!/usr/bin/env ruby

#Board

board = [
  ["-", "-", "-"],
  ["-", "-", "-"],
  ["-", "-", "-"]
]

puts board.map {|x| x.join(" | ")}

count_free_space = 9

while count_free_space >= 1

  # Step 1 - Get player 1 input
  puts "player 1 choose position: "
  puts "player 1 choose line"
  player_1_row = gets.chomp
  puts "player 1 choose column"
  player_1_column = gets.chomp

  # Step 2 - MODIFYING THE BOARD WITH PLAYER 1 INPUT
  if board[player_1_row.to_i][player_1_column.to_i] == "-"
    board[player_1_row.to_i][player_1_column.to_i] = "x"
    count_free_space -= 1
  else 
    p "space already fill"
  end

  # Step 3 - RE-PRINT THE BOARD WITH THE NEW VALUE
  puts board.map {|x| x.join(" | ")}
  
  #CHANGE OF PLAYERS

  # Step 4 - Get player input
  puts "player 2 choose position: "
  puts "player 2 choose line"
  player_2_row = gets.chomp
  puts "player 2 choose column"
  player_2_column = gets.chomp

  # Step 5 - MODIFYING THE BOARD WITH PLAYER 2 INPUT
  if board[player_2_row.to_i][player_2_column.to_i] == "-" 
    board[player_2_row.to_i][player_2_column.to_i] = "o"
    count_free_space -= 1
  else 
    p "space already fill"
  end

  # Step 6 - RE-PRINT THE BOARD WITH THE NEW VALUE
  puts board.map {|x| x.join(" | ")}

end

 