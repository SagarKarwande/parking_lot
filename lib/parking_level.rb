require './lib/parking_spot.rb'

# API for parking level
class ParkingLevel
  attr_accessor :parking_spots

  def initialize(parking_spots)
    unless parking_spots > 0
      raise ArgumentError,
            'Parking spot must be greater than 0'
    end

    @parking_spots = (1..parking_spots).map { |number| ParkingSpot.new(number) }
  end
end
