# spec/tictactoe_spec.rb
require './lib/logic'

describe GameLogic do
  subject { GameLogic.new }

  describe '#draw?' do
    context "check draw board" do 
      let(:draw_positive) {
        subject.check_draw(draw_board, "1", "1", "o")
      }

      let(:draw_negative) {
        subject.check_draw(not_draw_board, "2", "2", "x")
      }

      let(:draw_board) {
        [
          %w[o x x],
          %w[x o o],
          %w[o x x]
        ]
      }

      let(:not_draw_board) {
        [
          %w[- x x],
          %w[x - -],
          %w[o - x]
        ]
      }

      example 'draw game' do
        expect(draw_positive).to be true
      end

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