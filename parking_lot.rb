#!/usr/bin/env ruby

require './lib/commands.rb'

file_path = ARGV[0]

unless file_path
  execute = gets.to_s
  cmd = execute.split(' ')[0]
  args = execute.split(' ')[1..-1]
  send(cmd.to_sym, args)
end