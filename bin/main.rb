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
    con1 = player_row.length.positive? && (1..3).include?(player_row.to_i)
    con2 = player_column.length.positive? && (1..3).include?(player_column.to_i)
    if con1 && con2
      [player_row, player_column]
    else
      puts 'Wrong input, try entering numbers from 1 to 3'
      ask_play(name)
    end
  end

  def player_move(board, simbol, p_row, p_column, player)
    if board[p_row.to_i - 1][p_column.to_i - 1] == '-'
      board[p_row.to_i - 1][p_column.to_i - 1] = simbol
    else
      puts 'space already fill'
      pr, pc = ask_play(player)
      player_move(board, simbol, pr, pc, player)
    end
  end
end

module PlayGame
  def greeting_msg()
    puts "Hello!, Let's play some Tic Tac Toe"
    puts 'Rules are simple, whichever player that makes a line in 3 spaces wins!'
    puts 'You can place your move in the table by selecting a space between 1 & 3 for rows and columns'
    puts 'LET THE GAME BEGIN'
    sleep 2
  end

  def create_variables()
    new_game = Display.new
    winner = GameLogic.new
    board = new_game.board
    puts new_game.tabletop
    p1_name = ask_name('One')
    p2_name = ask_name('Two')
    game_status = winner.game_status
    [new_game, winner, board, p1_name, p2_name, game_status]
  end

  def break_game(new_game, winner, draw, name)
    if winner == true
      puts "#{name} wins this round!"
      puts new_game.tabletop
      true
    elsif draw == true
      puts 'Draw!'
      puts new_game.tabletop
      true
    end
  end

  def new_round()
    new_game, winner, board, p1_name, p2_name, game_status = create_variables

    puts new_game.tabletop

    while game_status
      p1_row, p1_column = ask_play(p1_name)
      player_move(board, 'x', p1_row, p1_column, p1_name)
      winnerp1 = winner.check_winner(board, p1_row, p1_column, 'x')
      drawp1 = winner.check_draw(board, p1_row, p1_column, 'x')
      break if break_game(new_game, winnerp1, drawp1, p1_name)

      puts "Nex player's turn!"
      puts new_game.tabletop

      p2_row, p2_column = ask_play(p2_name)
      player_move(board, 'o', p2_row, p2_column, p2_name)
      winnerp2 = winner.check_winner(board, p2_row, p2_column, 'o')
      drawp2 = winner.check_draw(board, p2_row, p2_column, 'x')
      break if break_game(new_game, winnerp2, drawp2, p2_name)

      puts "Nex player's turn!"
      puts new_game.tabletop
    end
  end

  def start_game()
    greeting_msg
    new_round
    puts 'Want to play another round? y/n'
    another_round = gets.chomp
    if another_round == 'y'
      new_round
    else
      puts 'See you next time!'
    end
  end
end

class GameNew
  include UserInputs
  include PlayGame

  def game()
    start_game
  end
end

GameNew.new.game
