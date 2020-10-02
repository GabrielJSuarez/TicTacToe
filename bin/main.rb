#!/usr/bin/env ruby

# Board


class Display

  attr_accessor :board, :simbol

  @@board = [
    ['-', '-', '-'],
    ['-', '-', '-'],
    ['-', '-', '-']
  ]
  def initialize (simbol)
    @simbol = simbol
  end

  def self.table
    puts (@@board.map { |x| x.join(' | ') })
  end

end

class UserInput < Display

  attr_accessor :player, :simbol, :player_row, :player_column

  def initialize(player, simbol)
    @player = player
    @player_row = ""
    @player_column = ""
  end

  def ask_input()
    puts "#{@player}, make your move: "
    puts "#{@player} chooses row"
    @player_row = gets.chomp.to_i 
    puts "#{@player} chooses column"
    @player_column = gets.chomp.to_i 
  end

  def check_play()
    unless (@player_row <= 2 && @player_row >= 0) && (@player_column <= 2 && @player_column >= 0)
      puts "not a valid input, try again"
      ask_input()
      check_play()
    end
  end

  def player_move(simbol)
    if @@board[@player_row][@player_column] == '-'
      @@board[@player_row][@player_column] = simbol
    else
      puts 'space already fill'
      ask_input()
      check_play()
      player_move(simbol)
    end
  end

end

class GameLogic < UserInput

  attr_accessor :game_status, :moves_left
  
  def initialize ()
    @game_status = true
  end  

  def check_winner(row, column, simbol)

    @winning_move_1 = @@board[row].all?(simbol)

    @winning_move_2= [@@board[0][column], @@board[1][column], @@board[2][column]].all?(simbol)

    @winning_move_3 = [@@board[0][0], @@board[1][1], @@board[2][2]].all?(simbol)

    @winning_move_4 = [@@board[0][2], @@board[1][1], @@board[2][0]].all?(simbol)

  
    if @winning_move_1 || @winning_move_2 || @winning_move_3 || @winning_move_4
      puts "Winner!"
      @game_status = false
    elsif @@board[0].include?("-") || @@board[1].include?("-") || @@board[2].include?("-")
      puts "Next player's turn"
      
    else
      puts "The game is a Draw!"
      @game_status = false
    end
  end
end

def play_game()

  puts "Player one name"
  player_one_name = gets.chomp
  puts "Player two name"
  player_two_name = gets.chomp

  player_one = Display.new("x")
  player_two = Display.new("o")

  player_one_input = UserInput.new(player_one_name, player_one.simbol)
  player_two_input = UserInput.new(player_two_name, player_two.simbol)

  winner = GameLogic.new()

  play_game = true

  while play_game
  
    Display.table
    
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

play_game()













