require 'spec_helper'
require 'game_of_life'

describe GameOfLife do
  describe "#run" do
    context "a cell is alive" do
      context "the cell has zero alive neighbours" do
        it "dies" do
          board = <<BOARD
0 0 0
0 1 0
0 0 0
BOARD
          board_after_one_iteration = <<BOARD
0 0 0
0 0 0
0 0 0
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end
      end

      context "the cell has one alive neighbour" do
        it "dies" do
          board = <<BOARD
0 0 0
0 1 1
0 0 0

BOARD
          board_after_one_iteration = <<BOARD
0 0 0
0 0 0
0 0 0
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end
      end

      context "the cell has two alive neighbours" do
        it "survives" do
          board = <<BOARD
0 0 0
1 1 1
0 0 0
BOARD
          board_after_one_iteration = <<BOARD
0 1 0
0 1 0
0 1 0
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end
      end

      context "the cell has three alive neighbours" do
        it "survives" do
          board = <<BOARD
0 1 0
1 1 1
0 0 0
BOARD
          board_after_one_iteration = <<BOARD
1 1 1
1 1 1
0 1 0
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end
      end

      context "the cell has four alive neighbours" do
        it "dies" do
          board = <<BOARD
0 1 0
1 1 1
0 1 0
BOARD
          board_after_one_iteration = <<BOARD
1 1 1
1 0 1
1 1 1
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end
      end

      context "the cell has five alive neighbours" do
        it "dies" do
          board = <<BOARD
1 1 0
1 1 1
0 1 0
BOARD
          board_after_one_iteration = <<BOARD
1 0 1
0 0 1
1 1 1
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end
      end

      context "the cell has six alive neighbours" do
        it "dies" do
          board = <<BOARD
1 1 1
1 1 1
0 1 0
BOARD
          board_after_one_iteration = <<BOARD
1 0 1
0 0 0
1 1 1
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end

        it "uses an infinite grid"
      end

      context "the cell has seven alive neighbours" do
        it "dies" do
          board = <<BOARD
1 1 1
1 1 1
1 1 0
BOARD
          board_after_one_iteration = <<BOARD
1 0 1
0 0 0
1 0 1
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end

        it "uses an infinite grid"
      end

      context "the cell has eight alive neighbours" do
        it "dies" do
          board = <<BOARD
1 1 1
1 1 1
1 1 1
BOARD
          board_after_one_iteration = <<BOARD
1 0 1
0 0 0
1 0 1
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end

        it "uses an infinite grid"
      end
    end

    context "a cell is dead" do
      context "the cell has zero alive neighbours" do
        it "remains dead"
      end

      context "the cell has one alive neighbour" do
        it "remains dead"
      end

      context "the cell has two alive neighbours" do
        it "remains dead"
      end

      context "the cell has three alive neighbours" do
        it "becomes a living cell"
      end

      context "the cell has four alive neighbours" do
        it "remains dead"
      end

      context "the cell has five alive neighbours" do
        it "remains dead"
      end

      context "the cell has six alive neighbours" do
        it "remains dead"
      end

      context "the cell has seven alive neighbours" do
        it "remains dead"
      end

      context "the cell has eight alive neighbours" do
        it "remains dead"
      end
    end

    it "can run multiple iterations" do
      board = <<BOARD
0 0 0
1 1 1
0 0 0
BOARD
      board_after_two_iterations = <<BOARD
0 0 0
1 1 1
0 0 0
BOARD
      game_of_life = GameOfLife.new(board)
      expect(game_of_life.run(iterations: 2)).to eq(board_after_two_iterations)
    end
  end
end
