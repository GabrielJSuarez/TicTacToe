# spec/tictactoe_spec.rb
require './lib/logic'

describe GameLogic do
  subject { 
    GameLogic.new 
  }
  
  context 'draw game' do
    let(:draw_board) {
      board = [
        ["o", "x", "x"],
        ["x", "o", "o"],
        ["o", "x", "x"]
      ]
    }

    let(:non_draw_board) {
      board = [
        ["o", "-", "x"],
        ["x", "-", "-"],
        ["o", "x", "-"]
      ]
    }

    example 'draw game' do
      expect(subject.check_draw(draw_board, '1', '1', 'x')).to be true
    end

    example 'non draw game' do
      expect(subject.check_draw(non_draw_board, '1', '1', 'o')).to be false
    end
  end

  context 'winner move' do
    let(:p1_wins) {
    [
      ["x", "x", "x"],
      ["o", "o", "x"],
      ["x", "o", "o"]
    ]
    }

    let(:p2_wins) {
    [
      ["x", "x", "o"],
      ["x", "o", "x"],
      ["o", "o", "x"]
    ]
    }

    let(:p1_simbol) { 'x' }

    let(:p2_simbol) { 'o' }

    example 'player 1 won' do
      expect(subject.check_winner(p1_wins, '1', '1', p1_simbol)).to be true
    end

    example 'player 2 won' do
      expect(subject.check_winner(p2_wins, '1', '1', p2_simbol)).to be true
    end
  end
  
end
