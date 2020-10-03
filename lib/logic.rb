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
    if (@player_row.to_i <= 3 && @player_row.to_i >= 1 && @player_row.length.positive?) &&
       (@player_column.to_i <= 3 && @player_column.to_i >= 1 && @player_column.length.positive?)
      return
    end

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
