require 'spec_helper'

describe Game do
  let(:player_one) { Player.new('homero', 'O') }
  let(:player_two) { Player.new('marge', 'X') }
  let(:board) { described_class.new(player_one, player_two) }

  describe '#play' do

  end
end
