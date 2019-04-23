require  '../lib/board.rb'
require '../lib/player.rb'

class Game
  def initialize(player1, player2)
    @player_1 = player1
    @player_2 = player2
    @board = Board.new([0,1,2,3,4,5,6,7,8,9])
    @turn = 1
  end

  def play
    until game_is_over
      @board.display

      player_turn = assign_player_in_turn

      puts "#{player_turn.name} select a number>>"
      choice = gets.chomp.to_i

      move = player_turn.save_choice(@board, choice)
      puts 'Choice is not valid' unless move

      @turn = toogle_turn
    end

    @board.display

    if winner?
      puts "Congratz #{winner?} you won"
    elsif @board.full?
      puts "It's a Tie!"
    end
  end

  private

  def game_is_over
    winner? || @board.full?
  end

  def winner?
    @player_1.winner? || @player_2.winner?
  end

  def assign_player_in_turn
    @turn == 1 ? @player_1 : @player_2
  end

  def toogle_turn
    @turn == 1 ? 0 : 1
  end
end

def start_game
  puts 'Who wants to be X?'
  player1 = Player.new(gets.chomp, 'X')
  puts "Who wants to be O?"
  player2 = Player.new(gets.chomp, 'O')

  Game.new(player1, player2).play
  puts "Do you want to play one more time? \n(Y/N)"
  reply = gets.chomp
  puts `clear`
  start_game unless reply.downcase == 'n'
end

start_game
