require_relative './parking_level.rb'

def create_parking_lot(args)
  ParkingLevel.new(args[0].to_i)
end
