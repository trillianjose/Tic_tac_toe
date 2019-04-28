require 'spec_helper'

describe Board do
  let(:board) { described_class.new([0,1,2,3,4,5,6,7,8,9]) }

  describe '#display' do
    it 'returns board' do
      expect(board.display).to eq("\t  1 | 2 | 3\n\t ---|---|---\n\t  4 | 5 | 6\n\t ---|---|---\n\t  7 | 8 | 9\n\n")
    end
  end

  describe '#fill' do
    it 'should fill with character in the given position' do
      expect{ board.fill(1, 'X') }.to change{ board.boxes[1] }.from(1).to('X')
    end
  end

  describe '#full?' do
    before do
      board.fill(1, 'O')
      board.fill(2, 'X')
      board.fill(3, 'X')
      board.fill(4, 'O')
      board.fill(5, 'X')
      board.fill(6, 'X')
      board.fill(7, 'O')
      board.fill(8, 'O')
    end

    context 'when board is full' do
      before { board.fill(9, 'X') }

      it 'should return true' do
        expect(board.full?).to be true
      end
    end

    context 'when board is not full' do
      it 'should return false' do
        expect(board.full?).to be false
      end
    end
  end

  describe '#is_fulled?' do
    context 'when position is fulled' do
      it 'should return false' do
        expect(board.is_fulled?(1)).to be false
      end
    end

    context 'when position is not fulled' do
      before { board.fill(1, 'X') }

      it 'should return true' do
        expect(board.is_fulled?(1)).to be true
      end
    end
  end

  describe 'valid_box?' do
    context 'when position exists' do
      it 'should return true' do
        expect(board.valid_box?(3)).to be true
      end
    end

    context 'when position does not exist' do
      it 'should return true' do
        expect(board.valid_box?(0)).to be false
      end
    end
  end
end
