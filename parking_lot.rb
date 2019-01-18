#!/usr/bin/env ruby

require './lib/commands.rb'

file_path = ARGV[0]
$parking_lot = nil

def execute_cmd(cmd, args)
  case cmd
  when 'create_parking_lot'
    $parking_lot = send(cmd.to_sym, args)
    "Created parking lot with #{args[0]} slots"
  when 'park'
    spot = send(cmd.to_sym, $parking_lot, args[0], args[1])
    if !spot.nil?
      return "Allocated​ ​ slot​ ​ number:​ ​ #{spot.number}"
    else
      return 'Sorry, parking lot is full'
    end
  when 'leave'
    spot = send(cmd.to_sym, $parking_lot, args[0])
    "Slot​ number​ #{args[0]} ​is​ ​free"
  when 'status'
    send(cmd.to_sym, $parking_lot)
  when 'registration_numbers_for_cars_with_colour'
    send(cmd.to_sym, $parking_lot, args[0])
  when 'slot_numbers_for_cars_with_colour'
    send(cmd.to_sym, $parking_lot, args[0])
  when 'slot_number_for_registration_number'
    slot = send(cmd.to_sym, $parking_lot, args[0])
    if !slot.nil?
      return slot.number
    else
      return 'Not found'
    end
  else
    'Invalid command'
  end
end

if file_path
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
