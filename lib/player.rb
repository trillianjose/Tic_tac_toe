class Player
  attr_reader :name, :character, :play

  WINNER_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]].freeze

  def initialize(name, character)
    @name = name
    @character = character
    @play = []
  end

  def save_choice(board, choice)
    return false if board.is_fulled?(choice) || !board.valid_box?(choice)

    board.fill(choice, self.character)
    @play.push(choice).sort!
  end

  def winner?
    WINNER_LINES.each { |line| return self.name if lines_match?(line) }
    false
  end

  def lines_match?(line)
    line & @play == line
  end
end
