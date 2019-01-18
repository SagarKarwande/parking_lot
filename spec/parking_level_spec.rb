require 'spec_helper'

describe ParkingLevel do
  describe 'new' do
    context 'create new parking level' do
      it 'always with available parking spots' do
        parking_level = ParkingLevel.new(4)
        expect(parking_level.parking_spots.length).to(eq(4))
      end

      it 'raise exception when number less than zero' do
        expect { ParkingLevel.new(0) }.to raise_error(ArgumentError)
      end
    end

    context 'park a car at parking level' do
      it 'with empty spot' do
        parking_level = ParkingLevel.new(4)
        spot = parking_level.park('KA-01-HH-1234', 'White')
        expect(spot.number).to eq(1)
        expect(spot.is_available).to be false
      end

      it 'fails without any empty slot' do
        parking_level = ParkingLevel.new(3)
        (1..3).each do |_number|
          parking_level.park('KA-01-HH-1234', 'White')
        end

        expect { parking_level.park('KA-01-HH-1234', 'White') }.to raise_error(ParkingSpotError)
      end
    end
  end
end
