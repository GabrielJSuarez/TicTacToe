#!/usr/bin/env ruby

# Board

class Display

  attr_accessor :board, :name, :symbol

  @@board = [
    ['-', '-', '-'],
    ['-', '-', '-'],
    ['-', '-', '-']
  ]

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    
  end

  def self.table
    puts (@@board.map { |x| x.join(' | ') })
  end

end

class UserInput < Display

  attr_accessor :player, :simbol

  def initialize(player, simbol)
    @player = player
    @simbol = simbol
  end

  def ask_input()
    puts "#{@player}, make your move: "
    puts "#{@player} chooses row"
    @player_row = gets.chomp 
    puts "#{@player} chooses column"
    @player_column = gets.chomp
  end

  def check_input()
    if (@player_row <= "2" && @player_row >= "0") && (@player_column <= "2" && @player_column >= "0")
      if @@board[@player_row.to_i][@player_column.to_i] == '-'
        @@board[@player_row.to_i][@player_column.to_i] = @simbol
      else
        puts 'space already fill'
      end
    else
      puts "not a valid position, try again!"
    end  
  end

end

class GameLogic < UserInput

  attr_accessor :game_status, :moves_left
  
  def initialize
    @game_status = true
    @moves_left = 9

    @winning_move_1 = @@board[@player_row.to_i].all?(@simbol)

    @winning_move_2= [@@board[0][@player_column.to_i], @@board[1][@player_column.to_i], @@board[2][@player_column.to_i]].all?(@simbol)
  
    @winning_move_3 = [@@board[0][0], @@board[1][1], @@board[2][2]].all?(@simbol)
  
    @winning_move_4 = [@@board[0][2], @@board[1][1], @@board[2][0]].all?(@simbol)
  end  
  
  # @winning_move_1 = @@board[@player_row.to_i].all?(@simbol)

  # @winning_move_2= [@@board[0][@player_column.to_i], @@board[1][@player_column.to_i], @@board[2][@player_column.to_i]].all?(@simbol)

  # @winning_move_3 = [@@board[0][0], @@board[1][1], @@board[2][2]].all?(@simbol)

  # @winning_move_4 = [@@board[0][2], @@board[1][1], @@board[2][0]].all?(@simbol)

  def check_winner()
    if @winning_move_1 || @winning_move_2 || @winning_move_3 || @winning_move_4
      puts "Winner!"
      @game_status = false
    elsif @moves_left == 0
      puts "The game is a Draw!"
      @game_status = false
    else
      puts "Next player's turn"
      @moves_left -=1
    end
  end
end

# module Executable
#   def get_input
#     puts "Player one name"
#     player_one_input = gets.chomp
#     puts "Player two name"
#     player_two_input = gets.chomp
#   end
# end


# #Playing the game

# def start_game()
#   #ask for inputs
#   get_input()
  
# end

puts "Player one name"
player_one_input = gets.chomp
puts "Player two name"
player_two_input = gets.chomp


winner = GameLogic.new

player_one = Display.new(player_one_input, "x")
player_two = Display.new(player_two_input, "o")

player_one_input = UserInput.new(player_one.name, player_one.symbol)

player_two_input = UserInput.new(player_two.name, player_two.symbol)

while winner.game_status

  Display.table

  player_one_input.ask_input
  player_one_input.check_input

  Display.table

  winner.check_winner()
  if winner.game_status == false || winner.moves_left == 0
    break
  end

  player_two_input.ask_input
  player_two_input.check_input

  Display.table

  winner.check_winner()
  if winner.game_status == false || winner.moves_left == 0
    break
  end
end




# while game_status
  
# end
