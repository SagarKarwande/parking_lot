require 'spec_helper'

describe ParkingLot do
  describe 'new' do
    context 'create new parking lot' do
      it 'with single level' do
        parking_lot = ParkingLot.new(4)
        expect(parking_lot.parking_levels.length).to(eq(1))
      end
    end

    context 'park a car' do
      it 'with empty slot' do
        parking_lot = ParkingLot.new(4)
        parking_slot = parking_lot.park('​KA-01-HH-3141', 'Black')
        expect(parking_slot.number).to eq(1)
      end

      it 'without a empty spot' do
        parking_lot = ParkingLot.new(1)
        parking_slot = parking_lot.park('​KA-01-HH-3141', 'Black')
        expect { parking_lot.park('​KA-01-HH-3141', 'Black') }.to raise_error(ParkingSpotError)
      end
    end
  end
end
