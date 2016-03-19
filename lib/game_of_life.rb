require "game_of_life/version"

class GameOfLife
  def initialize(board)
    @board = board
  end

  def run
    @board.chars.map.with_index do |cell, position|
      next "\n" if cell == "\n"
      should_live?(cell, position) ? alive_cell : dead_cell
    end.join
  end

  private

  def should_live?(cell, position)
    alive_neighbours_count = alive_neighbours_count(position)
    if alive_cell?(cell)
      [2, 3].include?(alive_neighbours_count)
    else
      [3].include?(alive_neighbours_count)
    end
  end

  def alive_neighbours_count(position)
    neighbours = neighbours(position)
    neighbours.select { |cell| alive_cell?(cell) }.count
  end

  def neighbours(position)
    [
      top_left_neighbour(position),
      top_neighbour(position),
      top_right_neighbour(position),
      left_neighbour(position),
      right_neighbour(position),
      bottom_left_neighbour(position),
      bottom_neighbour(position),
      bottom_right_neighbour(position)
    ]
  end

  def top_left_neighbour(position)
    cell_at_position(position - board_length - "\n".size - 1)
  end

  def top_neighbour(position)
    cell_at_position(position - board_length - "\n".size)
  end

  def top_right_neighbour(position)
    cell_at_position(position - board_length - "\n".size + 1)
  end

  def left_neighbour(position)
    cell_at_position(position - 1)
  end

  def right_neighbour(position)
    cell_at_position(position + 1)
  end

  def bottom_left_neighbour(position)
    cell_at_position(position + board_length + "\n".size - 1)
  end

  def bottom_neighbour(position)
    cell_at_position(position + board_length + "\n".size)
  end

  def bottom_right_neighbour(position)
    cell_at_position(position + board_length + "\n".size + 1)
  end

  def cell_at_position(position)
    (0..(@board.length - 1)).include?(position) ? @board.chars[position] : nil
  end

  def board_length
    @board.split("\n").first.length
  end

  def alive_cell?(cell)
    cell == alive_cell
  end

  def alive_cell
    "A"
  end

  def dead_cell
    "D"
  end
end
