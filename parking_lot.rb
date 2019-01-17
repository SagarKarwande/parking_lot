#!/usr/bin/env ruby

file_path = ARGV[0]
def create_parking_lot(args)
  puts args
end

unless file_path
  execute = gets.to_s
  cmd = execute.split(' ')[0]
  args = execute.split(' ')[1..-1]
  send(cmd.to_sym, args)
end

puts file_path
