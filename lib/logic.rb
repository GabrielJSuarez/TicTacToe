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


class GameLogic < UserInput
  attr_reader :game_status

  def initialize()
    @game_status = true
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
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
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity
end
