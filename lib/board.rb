class Board
  def initialize(boxes)
    @boxes = boxes
  end

  def display
    puts "\t  #{@boxes[1]} | #{@boxes[2]} | #{@boxes[3]} "
    puts "\t ---|---|---"
    puts "\t  #{@boxes[4]} | #{@boxes[5]} | #{@boxes[6]} "
    puts "\t ---|---|---"
    puts "\t  #{@boxes[7]} | #{@boxes[8]} | #{@boxes[9]} "
    puts ''
  end

  def fill(position, character)
    @boxes[position] = character
  end

  def full?
    @boxes[1..9].all? {|box| box.instance_of?(String) }
  end

  def is_fulled?(position)
    ['X', '0'].include? @boxes[position]
  end

  def valid_box?(position)
    @boxes[1..9].include?(position)
  end
end
