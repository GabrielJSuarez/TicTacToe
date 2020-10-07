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

class GameLogic
  attr_reader :game_status

  def initialize()
    @game_status = true
  end

  def check_winner(board, row, column, simbol)
    row = board[row.to_i - 1]
    col1 = board[0][column.to_i - 1]
    col2 = board[1][column.to_i - 1]
    col3 = board[2][column.to_i - 1]
    diag1 = [board[0][0], board[1][1], board[2][2]]
    diag2 = [board[0][2], board[1][1], board[2][0]]

    winningmove1 = row.all?(simbol)
    winningmove2 = [col1, col2, col3].all?(simbol)
    winningmove3 = diag1.all?(simbol)
    winningmove4 = diag2.all?(simbol)

    winner1 = winningmove1 || winningmove2
    winner2 = winningmove3 || winningmove4
    winner = winner1 || winner2

    if winner
      true
    else
      false
    end
  end

  def check_draw(board, _row, _column, _simbol)
    row1 = board[0].include?('-')
    row2 = board[1].include?('-')
    row3 = board[2].include?('-')

    if row1 || row2 || row3
      false
    else
      true
    end
  end
end
