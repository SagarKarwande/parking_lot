require 'spec_helper'

describe ParkingLot do
  describe 'new' do
    context 'create new parking lot' do
      it 'with single level' do
        parking_lot = ParkingLot.new(4)
        expect(parking_lot.parking_levels.length).to(eq(1))
      end
    end
  end
end