#!/usr/bin/env ruby

require './lib/logic'

module UserInputs

  def ask_name(num)
    puts "Player #{num}'s name"
    player_name = gets.chomp
    if player_name.length.zero?
      puts "Don't leave your name empty"
      ask_name(num)
    else
      player_name
    end
  end

  def ask_play(name)
    puts "#{name}, please enter your move: "
    puts 'Enter the row: '
    player_row = gets.chomp
    puts 'Enter the column: '
    player_column = gets.chomp
    if (player_row.to_i >= 0 && player_row.to_i <= 2 && player_row.length.positive?) && (player_column.to_i >= 0 && player_column.to_i <= 2 && player_column.length.positive?)
      [player_row, player_column]
    else
      puts 'Wrong input, try entering numbers from 0 to 2'
      ask_play(name)
    end
  end

end

include UserInputs

# rubocop:disable Metrics/MethodLength
def game_loop(player_one_input, player_two_input, player_one, player_two, winner)
  play_game = true
  while play_game

    player_one_input.ask_input
    player_one_input.check_play
    player_one_input.player_move(player_one.simbol)

    puts Display.table

    puts winner.check_winner(player_one_input.player_row, player_one_input.player_column, player_one.simbol)
    if winner.game_status == false
      play_game = winner.game_status
      break
    end

    player_two_input.ask_input
    player_two_input.check_play
    player_two_input.player_move(player_two.simbol)
    puts Display.table

    puts winner.check_winner(player_two_input.player_row, player_two_input.player_column, player_two.simbol)

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

  puts Display.table

  game_loop(player_one_input, player_two_input, player_one, player_two, winner)
end

play_game
