#!/usr/bin/env ruby
player_1
#display X to player_1
player_2
#display O to player_2

#while something 
  puts "player 1 choose position: "
  puts "player 1 choose line"
  player_1_row = gets.chomp
  puts "player 1 choose column"
  player_1_column = gets.chomp

  x_array << player_1_row
  begin
    #if there is a value in the position
  rescue StandardError => e
    puts "#{e.name}"    
  end
    #display the board with the X in the choice

  puts "player 2 choose position: "
  player_2 = gets.chomp
  begin
    #if there is a value in the position
  rescue StandardError => e
    puts "#{e.name}"    
  end
    #display the board with the O in the choice
#end of loop