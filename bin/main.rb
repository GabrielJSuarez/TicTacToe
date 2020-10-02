#!/usr/bin/env ruby

# Board

class Display
  attr_accessor :board, :simbol

  # rubocop:disable Style/ClassVars
  @@board = [
    ['-', '-', '-'],
    ['-', '-', '-'],
    ['-', '-', '-']
  ]
  # rubocop:enable Style/ClassVars

  def initialize(simbol)
    @simbol = simbol
  end

  def self.table
    puts(@@board.map { |x| x.join(' | ') })
  end
end

class UserInput < Display
  attr_accessor :player, :simbol, :player_row, :player_column

  def initialize(player, _simbol)
    @player = player
    @player_row = ''
    @player_column = ''
  end

  def ask_input()
    puts "#{@player}, make your move: "
    puts "#{@player} chooses row"
    @player_row = gets.chomp
    puts "#{@player} chooses column"
    @player_column = gets.chomp
  end

  def check_play()
    return if (@player_row.to_i <= 3 && @player_row.to_i >= 1 && @player_row.length.positive?) && (@player_column.to_i <= 3 && @player_column.to_i >= 1 && @player_column.length.positive?)
    puts 'not a valid input, try again'
    ask_input
    check_play
  end

  def player_move(simbol)
    if @@board[@player_row.to_i - 1][@player_column.to_i - 1] == '-'
      @@board[@player_row.to_i - 1][@player_column.to_i - 1] = simbol
    else
      puts 'space already fill'
      ask_input
      check_play
      player_move(simbol)
    end
  end
end

class GameLogic < UserInput
  attr_accessor :game_status, :moves_left

  def initialize()
    @game_status = true
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def check_winner(row, column, simbol)
    @winningmove1 = @@board[row.to_i - 1].all?(simbol)

    @winningmove2 = [@@board[0][column.to_i - 1], @@board[1][column.to_i - 1], @@board[2][column.to_i - 1]].all?(simbol)

    @winningmove3 = [@@board[0][0], @@board[1][1], @@board[2][2]].all?(simbol)

    @winningmove4 = [@@board[0][2], @@board[1][1], @@board[2][0]].all?(simbol)

    if @winningmove1 || @winningmove2 || @winningmove3 || @winningmove4
      puts 'Winner!'
      @game_status = false
    elsif @@board[0].include?('-') || @@board[1].include?('-') || @@board[2].include?('-')
      puts "Next player's turn"
    else
      puts 'The game is a Draw!'
      @game_status = false
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity
end

def define_name
  puts 'Player one name'
  player_one_name = gets.chomp
  puts 'Player two name'
  player_two_name = gets.chomp

  [player_one_name, player_two_name]
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
