require './lib/parking_level.rb'

class ParkingLot
  attr_accessor :parking_levels

  def initialize(parking_spot)
    @parking_levels = [ParkingLevel.new(parking_spot)]
  end

  def park(registration_number, car_color)
    ParkingLevel.park(registration_number, car_color)
  end
end
