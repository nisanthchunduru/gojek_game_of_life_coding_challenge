require "game_of_life/version"

class GameOfLife
  class Cell
    attr_reader :position

    def initialize(state, position, board)
      @state, @position, @board = state, position, board
    end

    def alive?
      @state == "1"
    end

    def x
      @position[0]
    end

    def y
      @position[1]
    end

    def should_live?
      if alive?
        [2, 3].include?(alive_neighbours_count)
      else
        [3].include?(alive_neighbours_count)
      end
    end

    def to_s
      alive? ? "1" : "0"
    end

    private

    def alive_neighbours_count
      neighbours.select { |cell| cell.alive? }.count
    end

    def neighbours
      [
        top_left_neighbour,
        top_neighbour,
        top_right_neighbour,
        left_neighbour,
        right_neighbour,
        bottom_left_neighbour,
        bottom_neighbour,
        bottom_right_neighbour
      ]
    end

    def top_left_neighbour
      neighbour_position = [x - 1, y - 1]
      @board.cell_at_position(neighbour_position)
    end

    def top_neighbour
      neighbour_position = [x, y - 1]
      @board.cell_at_position(neighbour_position)
    end

    def top_right_neighbour
      neighbour_position = [x + 1, y - 1]
      @board.cell_at_position(neighbour_position)
    end

    def left_neighbour
      neighbour_position = [x - 1, y]
      @board.cell_at_position(neighbour_position)
    end

    def right_neighbour
      neighbour_position = [x + 1, y]
      @board.cell_at_position(neighbour_position)
    end

    def bottom_left_neighbour
      neighbour_position = [x - 1, y + 1]
      @board.cell_at_position(neighbour_position)
    end

    def bottom_neighbour
      neighbour_position = [x, y + 1]
      @board.cell_at_position(neighbour_position)
    end

    def bottom_right_neighbour
      neighbour_position = [x + 1, y + 1]
      @board.cell_at_position(neighbour_position)
    end
  end

  class Board
    def self.from_string(board_string)
      board_length = board_string.split("\n").count
      board = new(board_length)

      board_string.split("\n").each_with_index do |row, x|
        row.split(" ").each_with_index do |char, y|
          cell_state, cell_position = char, [x, y]
          board.add_cell(Cell.new(cell_state, cell_position, board))
        end
      end

      board
    end

    def initialize(board_length)
      @board_length = board_length
    end

    def length
      @board_length
    end

    def each_cell
      (0..(@board_length - 1)).each do |x|
        (0..(@board_length - 1)).each do |y|
          yield cell_at_position([x, y])
        end
      end
    end

    def add_cell(cell)
      board_hash[cell.position] = cell if cell.alive?
    end

    def cell_at_position(cell_position)
      board_hash[cell_position]
    end

    def to_s
      (0..(@board_length - 1)).map do |x|
        (0..(@board_length - 1)).map do |y|
          cell_position = [x, y]
          cell = board_hash[cell_position]
          cell.to_s
        end.join(" ")
      end.join("\n") + "\n"
    end

    private

    def board_hash
      @board_hash ||= Hash.new { |_, cell_position| Cell.new('0', cell_position, self) }
    end
  end

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
