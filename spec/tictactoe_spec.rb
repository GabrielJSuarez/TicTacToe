# spec/tictactoe_spec.rb
require './lib/logic'

describe GameLogic do
  subject { GameLogic.new }

  context 'draw?' do
    let(:draw_positive) do
      subject.check_draw(board, p_row, p_column, simbol)
    end

    let(:draw_negative) do
      subject.check_draw(n_draw_board, p_row, p_column, simbol)
    end

    let(:board) do
      [
        %w[o x x],
        %w[x o o],
        %w[o x x]
      ]
    end

    let(:n_draw_board) do
      [
        %w[- x x],
        %w[x - -],
        %w[o - x]
      ]
    end

    let(:p_row) { '1' }

    let(:p_column) { '1' }

    let(:simbol) { 'o' }

    example 'draw game' do
      expect(draw_positive).to be true
    end

    example 'non draw game' do
      expect(draw_negative).to be false
    end
  end
end
