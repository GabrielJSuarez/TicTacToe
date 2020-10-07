# spec/tictactoe_spec.rb
require './lib/logic'

board = [
  %w[x o x],
  %w[o o x],
  %w[x o x]
]

describe GameLogic do
  context 'check if the game is over' do
    
    example 'check a draw game' do
      winner = GameLogic.new
      expect(winner.check_draw(board, '1', '1', 'x')).to eql(true)
    end

    example 'check if there is a winner' do
      winner = GameLogic.new
      expect(winner.check_winner(board, '1', '1', 'o')).to eql(false)
    end
    
  end
end
