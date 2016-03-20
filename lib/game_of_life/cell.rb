class GameOfLife
  class Cell
    attr_reader :position

    def initialize(position, board)
      @position, @board = position, board
    end

    def x
      @position[0]
    end

    def y
      @position[1]
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

  class LivingCell < Cell
    def alive?
      true
    end

    # Should the cell live in the next iteration?
    def should_live?
      [2, 3].include?(alive_neighbours_count)
    end

    def to_s
      "1"
    end
  end

  class DeadCell < Cell
    def alive?
      false
    end

    # Should the cell live in the next iteration?
    def should_live?
      [3].include?(alive_neighbours_count)
    end

    def to_s
      "0"
    end
  end
end
