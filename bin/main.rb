#!/usr/bin/env ruby

require './lib/logic'

def define_name
  puts 'Player one name'
  player_one_name = gets.chomp
  puts 'Player two name'
  player_two_name = gets.chomp
  if player_one_name.length.positive? && player_two_name.length.positive?
    [player_one_name, player_two_name]
  else
    puts "Can't leave your name empty!, now you both need to enter the name again, you fool!"
    define_name()
  end
end

def define_simbol
  player_one = Display.new('x')
  player_two = Display.new('o')
  [player_one, player_two]
end

def define_inputs(pl1, pl2, simb1, simb2)
  player_one_input = UserInput.new(pl1, simb1.simbol)
  player_two_input = UserInput.new(pl2, simb2.simbol)
  [player_one_input, player_two_input]
end

# rubocop:disable Metrics/MethodLength
def game_loop(player_one_input, player_two_input, player_one, player_two, winner)
  play_game = true
  while play_game

    player_one_input.ask_input
    player_one_input.check_play
    player_one_input.player_move(player_one.simbol)

    Display.table

    winner.check_winner(player_one_input.player_row, player_one_input.player_column, player_one.simbol)
    if winner.game_status == false
      play_game = winner.game_status
      break
    end

    player_two_input.ask_input
    player_two_input.check_play
    player_two_input.player_move(player_two.simbol)
    Display.table

    winner.check_winner(player_two_input.player_row, player_two_input.player_column, player_two.simbol)

    if winner.game_status == false
      play_game = winner.game_status
      break
    end
  end
end
# rubocop:enable Metrics/MethodLength

def play_game()
  player1_name, player2_name = define_name
  player_one, player_two = define_simbol
  player_one_input, player_two_input = define_inputs(player1_name, player2_name, player_one, player_two)

  winner = GameLogic.new

  Display.table

  game_loop(player_one_input, player_two_input, player_one, player_two, winner)
end

play_game
