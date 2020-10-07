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

  describe "#winner?" do
    context "p1 won" do
      let(:p1_wins) do
        subject.check_winner(board, "1", "2", "x")
      end

      let(:p1_does_not_wins) do
        subject.check_winner(board, "1", "2", "o")
      end

      let(:board) {
        [
          %w[x x x],
          %w[- - -],
          %w[- - -]
        ]
      }

      example 'p1 wins' do
        expect(p1_wins).to be true
      end

      example 'p1 loses' do
        expect(p1_does_not_wins).to be false
      end
    end

    context "p2 won" do
      let(:p2_wins) do
        subject.check_winner(board, "1", "1", "o")
      end

      let(:p2_does_not_wins) do
        subject.check_winner(board, "1", "1", "x")
      end

      let(:board) {
        [
          %w[o x x],
          %w[o - -],
          %w[o - -]
        ]
      }

      example 'p2 wins' do
        expect(p2_wins).to be true
      end

      example 'p2 loses' do
        expect(p2_does_not_wins).to be false
      end
    end
  end
end