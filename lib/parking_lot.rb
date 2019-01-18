require './lib/parking_level.rb'
require './lib/error/parking_spot_error'

class ParkingLot
  attr_accessor :parking_levels

  def initialize(parking_spot)
    @parking_levels = [ParkingLevel.new(parking_spot)]
  end

  def park(registration_number, car_color)
    @parking_levels.each do |parking_level|
      parking_spot = parking_level.park(registration_number, car_color)
      return parking_spot unless parking_spot.nil?

      raise ParkingSpotError, 'Now parking space available'
    end
  end
end
