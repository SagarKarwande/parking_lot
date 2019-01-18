require_relative './parking_level.rb'

def create_parking_lot(args)
  ParkingLevel.new(args[0].to_i)
end

def park(parking_lot, car_number, car_color)
  parking_lot.park(car_number, car_color)
end
