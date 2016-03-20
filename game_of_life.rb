#!/usr/bin/env ruby

lib_path = File.expand_path('../lib', __FILE__)
$:.unshift(lib_path)
require "game_of_life"

seed_data = File.read(ARGV[0])
# @todo: Cleanup
board = seed_data.gsub('0', 'D').gsub('1', 'A')
result_board = GameOfLife.new(board).run(iterations: 50)
result_board.split("\n").each do |line|
  puts line.gsub('D', '0 ').gsub('A', '1 ').strip
end
