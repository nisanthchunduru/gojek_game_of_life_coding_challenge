require "game_of_life/version"

class GameOfLife
  def initialize(board)
    @board = board
  end

  def run
    @board.gsub('A', 'D')
  end
end
