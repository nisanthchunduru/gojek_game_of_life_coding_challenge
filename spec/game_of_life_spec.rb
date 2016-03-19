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
    end
  end
end
