#!/usr/bin/env ruby

# Board

class Display

  attr_accessor :board, :users

  @@board = [
    ['-', '-', '-'],
    ['-', '-', '-'],
    ['-', '-', '-']
  ]

  private
  def self.board
    puts (@@board.map { |x| x.join(' | ') })
  end

  def self.users
    puts "Enter player's name"
    player_name = gets.chomp
    puts "Enter player's simbol"
    player_simbol = gets.chomp
  end
end

class UserInput

  attr_reader :simbol

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
      if board[@player_row.to_i][@player_column.to_i] == '-'
        board[@player_row.to_i][@player_column.to_i] = 'x'
        moves_left -= 1
      else
        puts 'space already fill'
      end
    else
      puts "not a valid position, try again!"
    end  
  end

end

# class GameLogic

#   attr_accessor :game_status, :moves_left

#   @@game_status = true
#   @@moves_left = 9

#   winning_move_1_p1 = board[player_1_row.to_i].all?("x")

#   winning_move_2_p1 = [board[0][player_1_column.to_i], board[1][player_1_column.to_i], board[2][player_1_column.to_i]].all?("x")

#   winning_move_3_p1 = [board[0][0], board[1][1], board[2][2]].all?("x")

#   winning_move_4_p1 = [board[0][2], board[1][1], board[2][0]].all?("x")

#   def check_winner()
#     if winning_move_1_p1 || winning_move_2_p1 || winning_move_3_p1 || winning_move_4_p1
#       puts "Winner!"
#       game_status = false
#     elsif moves_left == 0
#       puts "The game is a Draw!"
#       game_status = false
#     else
#       puts "Next player's turn"
#     end
#   end
  
  
  
# end

player = Display.users

p player.player_name
# player_one = UserInput.new(player_name, player_simbol)
# player_two = UserInput.new(player_name, player_simbol)

# player_one_simbol = player_one.simbol
# player_two_simbol = player_two.simbol

Display.board

# while game_status
  
# end
