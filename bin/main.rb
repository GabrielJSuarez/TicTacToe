#!/usr/bin/env ruby

require './lib/logic'

def define_name
  puts 'Player one name'
  player_one_name = gets.chomp
  puts 'Player two name'
  player_two_name = gets.chomp

  [player_one_name, player_two_name]
end

def play_game()
  player1_name, player2_name = define_name
  player_one, player_two = define_simbol
  player_one_input, player_two_input = define_inputs(player1_name, player2_name, player_one, player_two)

  winner = GameLogic.new

  Display.table

  game_loop(player_one_input, player_two_input, player_one, player_two, winner)
end

play_game
