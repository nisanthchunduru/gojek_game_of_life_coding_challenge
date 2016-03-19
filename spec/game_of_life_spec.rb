require 'spec_helper'
require 'game_of_life'

describe GameOfLife do
  describe "#run" do
    context "a cell is alive" do
      context "the cell has zero alive neighbours" do
        it "dies" do
          board = <<BOARD
DDD
DAD
DDD
BOARD
          board_after_one_iteration = <<BOARD
DDD
DDD
DDD
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end
      end

      context "the cell has one alive neighbour" do
        it "dies" do
          board = <<BOARD
DDD
DAA
DDD
BOARD
          board_after_one_iteration = <<BOARD
DDD
DDD
DDD
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end
      end

      context "the cell has two alive neighbours" do
        it "survives" do
          board = <<BOARD
DDD
AAA
DDD
BOARD
          board_after_one_iteration = <<BOARD
DAD
DAD
DAD
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end
      end

      context "the cell has three alive neighbours" do
        it "survives" do
          board = <<BOARD
DAD
AAA
DDD
BOARD
          board_after_one_iteration = <<BOARD
AAA
AAA
DAD
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end
      end

      context "the cell has four alive neighbours" do
        it "dies" do
          board = <<BOARD
DAD
AAA
DAD
BOARD
          board_after_one_iteration = <<BOARD
AAA
ADA
AAA
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end
      end

      context "the cell has five alive neighbours" do
        it "dies" do
          board = <<BOARD
AAD
AAA
DAD
BOARD
          board_after_one_iteration = <<BOARD
ADA
DDA
AAA
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end
      end

      context "the cell has six alive neighbours" do
        it "dies" do
          board = <<BOARD
AAA
AAA
DAD
BOARD
          board_after_one_iteration = <<BOARD
ADA
DDD
AAA
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end

        it "uses an infinite grid"
      end

      context "the cell has seven alive neighbours" do
        it "dies" do
          board = <<BOARD
AAA
AAA
AAD
BOARD
          board_after_one_iteration = <<BOARD
ADA
DDD
ADA
BOARD
          game_of_life = GameOfLife.new(board)
          expect(game_of_life.run).to eq(board_after_one_iteration)
        end

        it "uses an infinite grid"
      end

      context "the cell has eight alive neighbours" do
        it "dies" do
          board = <<BOARD
AAA
AAA
AAA
BOARD
          board_after_one_iteration = <<BOARD
ADA
DDD
ADA
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
  end
end
