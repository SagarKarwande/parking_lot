require_relative './parking_lot.rb'

def create_parking_lot(args)
  ParkingLot.new(args[0].to_i)
end

def park(parking_lot, car_number, car_color)
  parking_lot.park(car_number, car_color)
end

def leave(parking_lot, slot_number)
  parking_lot.leave(slot_number.to_i)
end

def status(parking_lot)
  parked_slots = parking_lot.get_parked_slot
  puts 'Slot​ No.  Registration​ No Colour'
  parked_slots.each do |slot|
    puts "#{slot.number} #{slot.vehicle.reg_num} #{slot.vehicle.color}"
  end
end

def registration_numbers_for_cars_with_colour(parking_lot, color)
  vehicles = parking_lot.get_vehicle_reg_by_color(color)
  reg_nums = vehicles.map(&:reg_num)
  puts reg_nums.join(', ')
end

def slot_numbers_for_cars_with_colour(parking_lot, color)
  slots = parking_lot.get_parking_slot_by_color(color)
  slot_numbers = slots.map(&:number)
  puts slot_numbers.join(', ')
end

def slot_number_for_registration_number(parking_lot, reg_num)
  parking_lot.get_slot_by_reg_number(reg_num)
end
