require "game_of_life/version"
require "game_of_life/board.rb"
require "game_of_life/cell.rb"

class GameOfLife
  def initialize(board_string)
    @board_string = board_string
  end

  def run(options = {})
    iteration_count = options.fetch(:iterations, 1)

    board_after_one_iteration = run_once
    if iteration_count == 1
      board_after_one_iteration
    else
      GameOfLife.new(board_after_one_iteration).run(iterations: iteration_count - 1)
    end
  end

  private

  def run_once
    current_board = Board.from_string(@board_string)
    new_board = Board.new(current_board.length)
    current_board.each_cell do |cell|
      new_cell = Cell.new('1', cell.position, new_board)
      new_board.add_cell(new_cell) if cell.should_live?
    end

    new_board.to_s
  end
end
