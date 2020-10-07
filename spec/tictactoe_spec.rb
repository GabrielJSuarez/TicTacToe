# spec/tictactoe_spec.rb
require './lib/logic'

describe GameLogic do
  subject { GameLogic.new }

  describe '#draw?' do
    context "game drawed" do 
      let(:draw_positive) do
        subject.check_draw(board, p_row, p_column, simbol)
      end

      let(:board) do
        [
          %w[o x x],
          %w[x o o],
          %w[o x x]
        ]
      end

      let(:p_row) { '1' }

      let(:p_column) { '1' }

      let(:simbol) { 'o' }

      example 'draw game' do
        expect(draw_positive).to be true
      end
    end
    
    context "not a draw" do
      let(:draw_negative) do
        subject.check_draw(board, p_row, p_column, simbol)
      end

      let(:board) {
        [
          %w[- x x],
          %w[x - -],
          %w[o - x]
        ]
      }

      let(:p_row) { '2' }

      let(:p_column) { '2' }

      let(:simbol) { 'x' }

      example 'non draw game' do
        expect(draw_negative).to be false
      end
    end
  end
end
