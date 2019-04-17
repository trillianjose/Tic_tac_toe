load '/../lib/board.rb'
load '/../lib/player.rb'

class Game
  def initialize(player1, player2)
    @player_1 = player1
    @player_2 = player2
    @board = Board.new([0,1,2,3,4,5,6,7,8,9])
    @turn = 1
    @lines = [
              [1,2,3],[4,5,6],[7,8,9],
              [1,4,7],[2,5,8],[3,6,9],
              [1,5,9],[3,5,7]
             ]
    start
  end

  private
  def start()
    until (winner?() || @board.full?())
      @turn == 1 ? plays(@player_1) : plays(@player_2)
      @turn = @turn == 1 ? 0 : 1
    end
    end_game
  end

  def end_game
    if winner?()
      @board.display()
      puts "Congratz #{winner?} you won"
    elsif @board.full?
      @board.display()
      puts "It's a Tie!"
    end
  end

  def winner?()
    players = [@player_1, @player_2]
    players.each {|player|
      @lines.each {|line|
        return player.name() if player.wins?(line)
      }
    }
    false
  end

  def plays(player)
    while 1
    @board.display()
      reply = player.get_choice(@board)
      if reply
        @board.fill(reply,player.character)
        player.play.push(reply).sort!
        puts 'clear'
        break
      end
    end
  end
end

def start_game()
  puts "Who wants to be X?"
  player1 = Player.new(gets.chomp,"X")
  puts "Who wants to be O?"
  player2 = Player.new(gets.chomp, "O")
  Game.new(player1, player2)
  puts "Do you want to play one more time? \n(Y/N)"
  reply = gets.chomp
  puts 'clear'
  start_game unless reply.downcase == "n"
end

start_game
