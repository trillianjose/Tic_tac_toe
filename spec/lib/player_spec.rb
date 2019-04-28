require 'spec_helper'
require 'byebug'

describe Player do
  let(:player) { described_class.new('marge', 'O') }

  describe '#save_choice' do
    let(:board) { Board.new([0,1,2,3,4,5,6,7,8,9]) }

    context 'when choice is valid' do
      it 'should full position in board' do
        expect{ player.save_choice(board, 1) }.to change{ board.boxes[1] }.from(1).to('O')
      end

      it 'should save position in @play' do
        player.save_choice(board, 2)

        expect(player.play).to eq([2])
      end

      it 'should save position in @play in order' do
        player.save_choice(board, 9)
        player.save_choice(board, 1)
        player.save_choice(board, 5)

        expect(player.play).to eq([1, 5, 9])
      end
    end

    context 'when choice is invalid' do
      context 'when choice is already taken' do
        before { board.boxes[1] = 'X' }

        it 'should return false' do
          expect(player.save_choice(board, 1)).to be false
        end
      end

      context 'when choice can not be taken' do
        it 'should return false' do
          expect(player.save_choice(board, 0)).to be false
        end
      end
    end

    describe '#winner?' do

    end

    describe '#lines_match?' do
      before do
        win_lines = [1,2,3]
      end
      it 'should return if a player win' do
        player.save_choice(board, 1)
        player.save_choice(board, 2)
        player.save_choice(board, 3)
        player.play should include(win_lines)
      end
    end
  end
end
