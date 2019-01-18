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

    context 'leave a parking spot' do
      it 'with parked vehicle' do
        parking_lot = ParkingLot.new(3)
        parking_lot.park('​KA-01-HH-3141', 'Black')
        parking_lot.park('​KA-01-HH-3142', 'White')
        expect(parking_lot.leave(1)).to be_truthy
      end

      it 'with invalid parking slot' do
        parking_lot = ParkingLot.new(3)
        expect { parking_lot.leave(6) }.to raise_error(ParkingSpotError)
      end
    end
  end
end
