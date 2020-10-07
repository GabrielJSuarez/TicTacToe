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
      let(:p1_winner) do
        subject.check_winner(board, p_row, p_column, simbol)
      end

      let(:board) {
        [
          %w[x x x],
          %w[- - -],
          %w[- - -]
        ]
      }

      let(:p_row) { '1' }

      let(:p_column) { '2' }

      let(:simbol) { 'x' }

      example 'non draw game' do
        expect(p1_winner).to be true
      end

      
    end

    context "p2 won" do
      let(:p2_winner) do
        subject.check_winner(board, p_row, p_column, simbol)
      end

      let(:board) {
        [
          %w[o o o],
          %w[- - -],
          %w[- - -]
        ]
      }

      let(:p_row) { '1' }

      let(:p_column) { '2' }

      let(:simbol) { 'o' }

      example 'non draw game' do
        expect(p2_winner).to be true
      end
    end
  end
end

# let(:board_2) {
#   [
#     %w[x - -],
#     %w[x - -],
#     %w[x - -]
#   ]
# }

# let(:board_3) {
#   [
#     %w[x - -],
#     %w[- x -],
#     %w[- - x]
#   ]
# }

# let(:board_4) {
#   [
#     %w[- - x],
#     %w[- x -],
#     %w[x - -]
#   ]
# }