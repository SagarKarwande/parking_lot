#!/usr/bin/env ruby

require './lib/commands.rb'

file_path = ARGV[0]
parking_lot = nil

unless file_path
  loop do
    puts 'Input :'
    execute = gets.to_s
    cmd = execute.split(' ')[0]
    args = execute.split(' ')[1..-1]

    case cmd
    when 'create_parking_lot'
      parking_lot = send(cmd.to_sym, args)
      puts "Created parking lot with #{args[0]} slots"
    else
      puts 'Invalid command'
    end
  end
end
