#!/usr/bin/env ruby

require './lib/commands.rb'

file_path = ARGV[0]
$parking_lot = nil

def execute_cmd(cmd, args)
  case cmd
  when 'create_parking_lot'
    $parking_lot = send(cmd.to_sym, args[0].to_i)
    "Created parking lot with #{args[0]} slots"
  when 'park'
    send(cmd.to_sym, $parking_lot, args[0], args[1])
  when 'status'
    send(cmd.to_sym, $parking_lot)
  when 'leave', 'registration_numbers_for_cars_with_colour',
      'slot_numbers_for_cars_with_colour', 'slot_number_for_registration_number'
    send(cmd.to_sym, $parking_lot, args[0])
  else
    'Invalid command'
  end
end

if file_path
  raise ArgumentError, 'Files does not exits' unless File.exist?(file_path)

  File.readlines(file_path).each do |line|
    execute = line
    cmd = execute.split(' ')[0]
    args = execute.split(' ')[1..-1]
    cmd_output = execute_cmd(cmd, args)
    puts(cmd_output)
  end
else
  loop do
    puts "\nInput :"
    execute = gets.to_s
    cmd = execute.split(' ')[0]
    args = execute.split(' ')[1..-1]
    cmd_output = execute_cmd(cmd, args)
    puts "\nOutput :"
    puts cmd_output
  end
end
