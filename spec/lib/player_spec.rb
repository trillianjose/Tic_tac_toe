require 'spec_helper'

describe Player do
  let(:player) { described_class.new('marge', 'O') }
  let(:board) { Board.new([0,1,2,3,4,5,6,7,8,9]) }

  describe '#save_choice' do
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
  end

  describe '#winner?' do
    context 'when player is winner' do
      before do
        player.save_choice(board, 1)
        player.save_choice(board, 2)
        player.save_choice(board, 3)
      end

      it 'should return name of player' do
        expect(player.winner?).to eq 'marge'
      end
    end

    context 'when player is not winner' do
      before do
        player.save_choice(board, 2)
        player.save_choice(board, 6)
        player.save_choice(board, 8)
      end

      it 'should return false' do
        expect(player.winner?).to be false
      end
    end
  end
end
