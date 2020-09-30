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

  # Step 1 - GET PLAYER 1 INPUT
  puts "player 1 choose position: "
  puts "player 1 choose line"
  player_1_row = gets.chomp
  # Step 2 - CHECK IF ITS VALID INPUT
  puts "player 1 choose column"
  player_1_column = gets.chomp
  # Step 3 - CHECK IF ITS VALID INPUT

  # Step 4 - MODIFYING THE BOARD WITH PLAYER 1 INPUT
  if board[player_1_row.to_i][player_1_column.to_i] == "-"
    board[player_1_row.to_i][player_1_column.to_i] = "x"
    count_free_space -= 1
  else 
    #Step 5 - IF POSITION IS NOT VALID ASK FOR NEW POSITION
    p "space already fill"
  end
  
  # Step 6 - RE-PRINT THE BOARD WITH THE NEW VALUE
  puts board.map {|x| x.join(" | ")}
  # STEP 7 -CHECK IF PLAYER 1 IS THE WINNER, IF PLAYER 1 WIN RETURN RESULT, GAME END
  
  #CHANGE OF PLAYERS

  # Step 7 - GET PLAYER 2 INPUT
  puts "player 2 choose position: "
  puts "player 2 choose line"
  player_2_row = gets.chomp
  # Step 8 - CHECK IF ITS VALID INPUT
  puts "player 2 choose column"
  player_2_column = gets.chomp
  # Step 9 - CHECK IF ITS VALID INPUT

  # Step 10 - MODIFYING THE BOARD WITH PLAYER 2 INPUT
  if board[player_2_row.to_i][player_2_column.to_i] == "-" 
    board[player_2_row.to_i][player_2_column.to_i] = "o"
    count_free_space -= 1
  else 
    #Step 11 - IF POSITION IS NOT VALID ASK FOR NEW POSITION
    p "space already fill"
  end

  # Step 12 - RE-PRINT THE BOARD WITH THE NEW VALUE
  puts board.map {|x| x.join(" | ")}

  # STEP 13 -CHECK IF PLAYER 2 IS THE WINNER, IF PLAYER 2 WIN RETURN RESULT, GAME END

  # Step 14 - IF NO PLAYER WINS, MESSAGE GAME IS DRAW, GAME END

end

 