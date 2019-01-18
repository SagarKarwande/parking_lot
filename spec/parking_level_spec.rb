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
  end
end
