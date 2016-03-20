#!/usr/bin/env ruby

lib_path = File.expand_path('../lib', __FILE__)
$:.unshift(lib_path)
require "game_of_life"

board_string = File.read(ARGV[0])
print GameOfLife.new(board_string).run(iterations: 50)
