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
