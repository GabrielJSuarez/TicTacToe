#!/usr/bin/env ruby

#Board

board = [
  [["-"], ["-"], ["-"]],
  [["-"], ["-"], ["-"]],
  [["-"], ["-"], ["-"]]
]
display = board.map {|x| x.join(" | ")}
puts  display


# #while something

#   #PLAYER ONE INPUT
#   puts "player 1 choose position: "
#   puts "player 1 choose line"
#   player_1_row = gets.chomp
#   puts "player 1 choose column"
#   player_1_column = gets.chomp

#   #MODIFYING THE BOARD WITH PLAYER 1 INPUT
#   if board[player_1_row.to_i][player_1_column.to_i] === "-"
#       board[player_1_row.to_i][player_1_column.to_i] = "x"
#   else 
#     error "space already fill"
#   end

#   #RE-PRINT THE BOARD WITH THE NEW VALUE
#   puts display
#   your move has been display


  

#   #CHANGE OF PLAYERS
  
#   puts "player 2 choose position: "
#   puts "player 2 choose line"
#   player_2_row = gets.chomp
#   puts "player 2 choose column"
#   player_2_column = gets.chomp

#   #MODIFYING THE BOARD WITH PLAYER 1 INPUT
#   if board[player_2_row.to_i][player_2_column.to_i] === "-" 
#       board[player_2_row.to_i][player_2_column.to_i] = "o"
#   else 
#     error "space already fill"
#   end
#   #RE-PRINT THE BOARD WITH THE NEW VALUE
#   puts display
#   your move has been display



# #   begin
# #     #if there is a value in the position
# #   rescue StandardError => e
# #     puts "#{e.name}"    
# #   end
# #     #display the board with the X in the choice

# #   puts "player 2 choose position: "
# #   player_2 = gets.chomp
# #   begin
# #     #if there is a value in the position
# #   rescue StandardError => e
# #     puts "#{e.name}"    
# #   end
# #     #display the board with the O in the choice
# # #end of loop