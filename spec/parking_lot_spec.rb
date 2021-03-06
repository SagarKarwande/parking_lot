require 'spec_helper'

describe ParkingLot do
  describe 'new' do
    context 'create new parking lot' do
      it 'always with available parking spots' do
        parking_lot = ParkingLot.new(4)
        expect(parking_lot.parking_spots.length).to(eq(4))
      end

      it 'raise exception when number less than zero' do
        expect { ParkingLot.new(0) }.to raise_error(ArgumentError)
      end
    end

    context 'park a car at parking lot' do
      it 'with empty spot' do
        parking_lot = ParkingLot.new(4)
        spot = parking_lot.park('KA-01-HH-1234', 'White')
        expect(spot.number).to eq(1)
        expect(spot.is_available).to be false
      end

      it 'fails without any empty slot' do
        parking_lot = ParkingLot.new(3)
        (1..3).each do |_number|
          parking_lot.park('KA-01-HH-1234', 'White')
        end

        parking_spot = parking_lot.park('KA-01-HH-1234', 'White')
        expect(parking_spot).to be_nil
      end
    end

    context 'get parking slot' do
      it 'with valid spot' do
        parking_lot = ParkingLot.new(3)
        parking_slot = parking_lot.get_spot(2)
        expect(parking_slot.number).to(eq(2))
      end

      it 'with invalid number' do
        parking_lot = ParkingLot.new(3)
        parking_slot = parking_lot.get_spot(4)
        expect(parking_slot).to be_nil
      end
    end

    context 'leave parking slot' do
      it 'with valid slot' do
        parking_lot = ParkingLot.new(3)
        parking_slot = parking_lot.leave(2)
        expect(parking_slot).to be true
      end

      it 'with invalid slot number' do
        parking_lot = ParkingLot.new(3)
        expect { parking_lot.leave(4) }.to raise_error(ParkingSpotError)
      end

      context 'get parked slots' do
        it 'successfully' do
          parking_lot = ParkingLot.new(3)
          parking_lot.park('KA-01-HH-1234', 'White')
          filled_slot = parking_lot.get_parked_slot
          expect(filled_slot.length).to eq(1)
        end
      end
    end

    context 'vehicle reg by color' do
      it 'successfully' do
        parking_lot = ParkingLot.new(3)
        parking_lot.park('KA-01-HH-1234', 'White')
        parking_lot.park('KA-02-HH-1234', 'White')
        parking_lot.park('KA-03-HH-1234', 'Red')
        white_vehicles = parking_lot.get_vehicle_reg_by_color('White')
        red_vehicles = parking_lot.get_vehicle_reg_by_color('Red')
        expect(white_vehicles.length).to eq(2)
        expect(red_vehicles.length).to eq(1)
      end
    end

    context 'slot by color' do
      it 'successfully' do
        parking_lot = ParkingLot.new(3)
        parking_lot.park('KA-01-HH-1234', 'White')
        parking_lot.park('KA-02-HH-1234', 'White')
        parking_lot.park('KA-03-HH-1234', 'Red')
        white_vehicles = parking_lot.get_parking_slot_by_color('White')
        red_vehicles = parking_lot.get_parking_slot_by_color('Red')
        expect(white_vehicles.length).to eq(2)
        expect(red_vehicles.length).to eq(1)
      end
    end

    context 'get slot by registration number' do
      it 'succeds with valid value' do
        parking_lot = ParkingLot.new(3)
        parking_lot.park('KA-01-HH-1234', 'White')
        parking_lot.park('KA-02-HH-1234', 'White')
        slot = parking_lot.get_slot_by_reg_number('KA-02-HH-1234')
        expect(slot.number).to eq(2)
      end

      it 'fails with invalid value' do
        parking_lot = ParkingLot.new(3)
        parking_lot.park('KA-01-HH-1234', 'White')
        parking_lot.park('KA-02-HH-1234', 'White')
        slot = parking_lot.get_slot_by_reg_number('MH-02-HH-1235')
        expect(slot).to be_nil
      end
    end
  end
end
