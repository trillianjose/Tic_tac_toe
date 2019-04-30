require 'spec_helper'

shared_examples 'winner? returns false' do
  before do
    player_two.save_choice(board, 7)
    player_one.save_choice(board, 9)
  end

  it 'should return false' do
    expect(player_one.winner?).to be false
  end
end

describe Player do
  let(:player_one) { described_class.new('marge', 'O') }
  let(:player_two) { described_class.new('homero', 'X') }
  let(:board) { Board.new([0,1,2,3,4,5,6,7,8,9]) }

  describe '#save_choice' do
    context 'when choice is valid' do
      it 'should full position in board' do
        expect{ player_one.save_choice(board, 1) }.to change{ board.boxes[1] }.from(1).to('O')
      end

      it 'should save position in @play' do
        player_one.save_choice(board, 2)

        expect(player_one.play).to eq([2])
      end

      it 'should save position in @play in order' do
        player_one.save_choice(board, 9)
        player_one.save_choice(board, 1)
        player_one.save_choice(board, 5)

        expect(player_one.play).to eq([1, 5, 9])
      end
    end

    context 'when choice is invalid' do
      context 'when choice is already taken' do
        before { board.boxes[1] = 'X' }

        it 'should return false' do
          expect(player_one.save_choice(board, 1)).to be false
        end
      end

      context 'when choice can not be taken' do
        it 'should return false' do
          expect(player_one.save_choice(board, 0)).to be false
        end
      end
    end
  end

  describe '#winner? on first chance' do
    before do
      player_one.save_choice(board, 5)
      player_two.save_choice(board, 1)
      player_one.save_choice(board, 2)
      player_two.save_choice(board, 7)
    end

    context 'when there is a winner' do
      before do
        player_one.save_choice(board, 8)
      end

      it 'should return name of player' do
        expect(player_one.winner?).to eq 'marge'
      end
    end
  end

  describe '#winner? on last play' do
    before do
      player_one.save_choice(board, 5)
      player_two.save_choice(board, 1)
      player_one.save_choice(board, 2)
      player_two.save_choice(board, 8)
      player_one.save_choice(board, 4)
      player_two.save_choice(board, 6)
      player_one.save_choice(board, 3)
    end

    context 'when there is a winner' do
      before do
        player_two.save_choice(board, 9)
        player_one.save_choice(board, 7)
      end

      it 'should return name of player' do
        expect(player_one.winner?).to eq 'marge'
      end
    end

    context 'when there is not winner' do
      include_examples 'winner? returns false'
    end

    context 'when there is tie' do
      include_examples 'winner? returns false'
    end
  end
end
