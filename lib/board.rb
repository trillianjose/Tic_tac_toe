class Board
  attr_accessor :play

  def initialize(play)
    @play = play
  end

  def display()
    puts "\t  #{@play[1]} | #{@play[2]} | #{@play[3]} "
    puts "\t ---|---|---"
    puts "\t  #{@play[4]} | #{@play[5]} | #{@play[6]} "
    puts "\t ---|---|---"
    puts "\t  #{@play[7]} | #{@play[8]} | #{@play[9]} "
    puts ""
  end

  def fill(pos, character)
    @play[pos] = character
  end

  def full?
    @play[1..9].all? {|x|
      x.instance_of?(String)
    }
  end

  def is_fulled?(num)
    @play[num] == "X" || "O" == @play[num]
  end
end
