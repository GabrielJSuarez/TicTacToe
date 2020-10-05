class Display
    attr_reader :board
  
    def initialize
      @board = [
        ['-', '-', '-'],
        ['-', '-', '-'],
        ['-', '-', '-']
      ]
    end
  
    def tabletop()
      @board.map { |x| x.join(' | ') }
    end
  end
  
  module PlayGame
  
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
  
    def check_winner(board, row, column, simbol)
      winner = nil
  
      winningmove1 = board[row.to_i].all?(simbol)
  
      winningmove2 = [board[0][column.to_i], board[1][column.to_i], board[2][column.to_i]].all?(simbol)
  
      winningmove3 = [board[0][0], board[1][1], board[2][2]].all?(simbol)
  
      winningmove4 = [board[0][2], board[1][1], board[2][0]].all?(simbol)
  
      if winningmove1 || winningmove2 || winningmove3 || winningmove4
        winner = true
      elsif board[0].include?('-') || board[1].include?('-') || board[2].include?('-')
        winner = nil
      else
        winner = false
      end
    end
  end
  
  include PlayGame
  
  def mod_board()
    new_game = Display.new
    board = new_game.board
    puts new_game.tabletop()
    game_status = true
    p1_name = ask_name('One')
    p2_name = ask_name('Two')
  
    while game_status
      p1_row, p1_column = ask_play(p1_name)
      player_move(board, 'x', p1_row, p1_column)
      winnerp1 = check_winner(board, p1_row, p1_column, 'x')
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
      winnerp2 = check_winner(board, p2_row, p2_column, 'o')
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
  
  mod_board()