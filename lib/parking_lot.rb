require './lib/parking_spot.rb'
require './lib/vehicle.rb'
require './lib/error/parking_spot_error.rb'

# API for parking lot
class ParkingLot
  attr_accessor :parking_spots

  def initialize(parking_spots)
    unless parking_spots > 0
      raise ArgumentError,
            'Parking spot must be greater than 0'
    end

    @parking_spots = (1..parking_spots).map { |number| ParkingSpot.new(number) }
  end

  def park(registration_number, car_color)
    parking_spot = get_nearest_available_spot

    return nil if parking_spot.nil?

    vehicle = Vehicle.new(registration_number, car_color)
    parking_spot.vehicle = vehicle
    parking_spot.is_available = false

    parking_spot
  end

  def get_nearest_available_spot
    parking_spots.each do |spot|
      return spot if spot.is_available
    end
    nil
  end

  def get_spot(slot_number)
    parking_spots.each do |slot|
      return slot if slot.number == slot_number
    end
    nil
  end

  def leave(slot_number)
    parking_spot = get_spot(slot_number)

    raise ParkingSpotError, 'No parking spot present' if parking_spot.nil?

    parking_spot.is_available = true
    true
  end

  def get_parked_slot
    @parking_spots.take_while { |spot| spot.is_available == false }
  end

  def get_vehicle_reg_by_color(color)
    parked_slots = get_parked_slot
    parked_slots.reduce([]) do |acc, slot|
      if slot.vehicle.color.eql? color
        acc << slot.vehicle
      else
        acc
      end
    end
  end

  def get_parking_slot_by_color(color)
    parked_slots = get_parked_slot
    parked_slots.reduce([]) do |acc, slot|
      if slot.vehicle.color.eql? color
        acc << slot
      else
        acc
      end
    end
  end

  def get_slot_by_reg_number(reg_number)
    @parking_spots.each do |slot|
      return slot if slot.vehicle && slot.vehicle.reg_num == reg_number
    end
    nil
  end
end
