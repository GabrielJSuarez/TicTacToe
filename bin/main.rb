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

  def player_move(board, simbol, p_row, p_column)
    if board[p_row.to_i][p_column.to_i] == '-'
      board[p_row.to_i][p_column.to_i] = simbol
    else
      puts 'space already fill'
      ask_play(name)
      player_move(board, simbol, p_row, p_column)
    end
  end

end

include UserInputs

# rubocop:disable Metrics/MethodLength

def mod_board()
  winner = GameLogic.new
  new_game = Display.new
  board = new_game.board
  puts new_game.tabletop()
  game_status = true
  p1_name = ask_name('One')
  p2_name = ask_name('Two')

  while game_status
    p1_row, p1_column = ask_play(p1_name)
    player_move(board, 'x', p1_row, p1_column) 
    winnerp1 = winner.check_winner(board, p1_row, p1_column, 'x')
    if winnerp1 == true
      game_status = false
      puts "Winner!"
      puts new_game.tabletop()
      break
    elsif winnerp1 == false
      game_status = false
      puts "Draw!"
      puts new_game.tabletop()
      break
    end
    puts "Nex player's turn!"
    puts new_game.tabletop()

    p2_row, p2_column = ask_play(p2_name)
    player_move(board, 'o', p2_row, p2_column)
    winnerp2 = winner.check_winner(board, p2_row, p2_column, 'o')
    if winnerp2 == true
      game_status = false
      puts "Winner!"
      puts new_game.tabletop()
      break
    elsif winnerp2 == false
      game_status = false
      puts "Draw!"
      puts new_game.tabletop()
      break
    end
    puts "Nex player's turn!"
    puts new_game.tabletop()
  end
end
# def game_loop(player_one_input, player_two_input, player_one, player_two, winner)
#   play_game = true
#   while play_game

#     player_one_input.ask_input
#     player_one_input.check_play
#     player_one_input.player_move(player_one.simbol)

#     puts Display.table

#     puts winner.check_winner(player_one_input.player_row, player_one_input.player_column, player_one.simbol)
#     if winner.game_status == false
#       play_game = winner.game_status
#       break
#     end

#     player_two_input.ask_input
#     player_two_input.check_play
#     player_two_input.player_move(player_two.simbol)
#     puts Display.table

#     puts winner.check_winner(player_two_input.player_row, player_two_input.player_column, player_two.simbol)

#     if winner.game_status == false
#       play_game = winner.game_status
#       break
#     end
#   end
# end
# # rubocop:enable Metrics/MethodLength

# def play_game()
#   player1_name, player2_name = define_name
#   player_one, player_two = define_simbol
#   player_one_input, player_two_input = define_inputs(player1_name, player2_name, player_one, player_two)

#   winner = GameLogic.new

#   puts Display.table

#   game_loop(player_one_input, player_two_input, player_one, player_two, winner)
# end

# play_game

mod_board()
