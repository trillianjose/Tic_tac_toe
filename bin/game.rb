require  '../lib/board.rb'
require '../lib/player.rb'

class Game
  def initialize(player1, player2)
    @player_1 = player1
    @player_2 = player2
    @board = Board.new([0,1,2,3,4,5,6,7,8,9])
    @turn = 1
  end

  def start
    until winner? || @board.full?
      @turn == 1 ? @player_1.plays(@board) : @player_2.plays(@board)
      @turn = @turn == 1 ? 0 : 1
    end

    end_game
  end

  private

  def end_game
    if winner?
      @board.display
      puts "Congratz #{winner?} you won"
    elsif @board.full?
      @board.display
      puts "It's a Tie!"
    end
  end

  def winner?
    @player_1.winner? || @player_2.winner?
  end
end

def start_game
  puts 'Who wants to be X?'
  player1 = Player.new(gets.chomp, 'X')
  puts "Who wants to be O?"
  player2 = Player.new(gets.chomp, 'O')

  Game.new(player1, player2).start
  puts "Do you want to play one more time? \n(Y/N)"
  reply = gets.chomp
  puts `clear`
  start_game unless reply.downcase == 'n'
end

start_game
