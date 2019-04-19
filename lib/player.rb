class Player
  attr_reader :name, :character, :play

  def initialize(name, character)
    @name = name
    @character = character
    @play = []
    @winner_lines = [
              [1,2,3],[4,5,6],[7,8,9],
              [1,4,7],[2,5,8],[3,6,9],
              [1,5,9],[3,5,7]
             ]
  end

  def wins?(line)
    line && @play == line
  end

  def get_choice(game_board)
    puts "#{@name} select a number>>"
    choice = gets.chomp.to_i
    if (1..9).include?(choice)
      game_board.is_fulled?(choice) ? puts("Try again, that spot has been taken already.\n\n") : choice
    else
      puts('Enter a valid number, please.')
    end
  end

  def winner?
    @winner_lines.each { |line| return self.name if self.wins?(line) }
    false
  end

  def plays(board)
    while 1
    board.display
      reply = self.get_choice(board)
      if reply
        board.fill(reply, self.character)
        @play.push(reply).sort!
        break
      end
    end
  end
end
