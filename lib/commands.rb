require_relative './parking_lot.rb'

def create_parking_lot(args)
  ParkingLot.new(args[0].to_i)
end

def park(parking_lot, car_number, car_color)
  slot = parking_lot.park(car_number, car_color)
  if !slot.nil?
    return "Allocated​ ​ slot​ ​ number:​ ​ #{slot.number}"
  else
    return 'Sorry, parking lot is full'
  end
end

def leave(parking_lot, slot_number)
  parking_lot.leave(slot_number.to_i)
  "Slot​ number​ #{slot_number} ​is​ ​free"
end

def status(parking_lot)
  parked_slots = parking_lot.get_parked_slot
  status = "Slot​ No.  Registration​ No Colour\n"
  parked_slots.each do |slot|
    status += format("%-5s %15s %-10s \n", slot.number, slot.vehicle.reg_num, slot.vehicle.color)
  end
  status
end

def registration_numbers_for_cars_with_colour(parking_lot, color)
  vehicles = parking_lot.get_vehicle_reg_by_color(color)
  reg_nums = vehicles.map(&:reg_num)
  reg_nums.join(', ')
end

def slot_numbers_for_cars_with_colour(parking_lot, color)
  slots = parking_lot.get_parking_slot_by_color(color)
  slot_numbers = slots.map(&:number)
  slot_numbers.join(', ')
end

def slot_number_for_registration_number(parking_lot, reg_num)
  slot = parking_lot.get_slot_by_reg_number(reg_num)
  if !slot.nil?
    return slot.number
  else
    return 'Not found'
  end
end
