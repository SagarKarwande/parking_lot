#!/usr/bin/env ruby

require './lib/commands.rb'

file_path = ARGV[0]
$parking_lot = nil

def handle_command(cmd, args)
  case cmd
  when 'create_parking_lot'
    $parking_lot = send(cmd.to_sym, args)
    puts "\nOutput:\nCreated parking lot with #{args[0]} slots"
  when 'park'
    spot = send(cmd.to_sym, $parking_lot, args[0], args[1])
    if !spot.nil?
      puts "\nOutput:\nAllocated​ ​ slot​ ​ number:​ ​ #{spot.number}"
    else
      puts 'Sorry, parking lot is free'
    end
  when 'leave'
    spot = send(cmd.to_sym, $parking_lot, args[0])
    puts "\nOutput:\nSlot​ number​ #{args[0]} ​is​ ​free"
  when 'status'
    send(cmd.to_sym, $parking_lot)
  when 'registration_numbers_for_cars_with_colour'
    send(cmd.to_sym, $parking_lot, args[0])
  when 'slot_numbers_for_cars_with_colour'
    send(cmd.to_sym, $parking_lot, args[0])
  when 'slot_number_for_registration_number'
    slot = send(cmd.to_sym, $parking_lot, args[0])
    if !slot.nil?
      puts slot.number
    else
      puts 'Not found'
    end
  else
    puts 'Invalid command'
  end
end

if file_path
  File.readlines(file_path).each do |line|
    execute = line
    cmd = execute.split(' ')[0]
    args = execute.split(' ')[1..-1]
    handle_command(cmd, args)
  end
else
  loop do
    puts 'Input :'
    execute = gets.to_s
    cmd = execute.split(' ')[0]
    args = execute.split(' ')[1..-1]
    handle_command(cmd, args)
  end
end
