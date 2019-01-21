require 'spec_helper'
require './lib/commands.rb'
require 'pry'

describe 'Commands' do
  context 'create a new parking lot' do
    it 'successfully ' do
      parking_lot = create_parking_lot(10)
      expect(parking_lot.parking_spots.length).to(eq(10))
    end

    it 'fails with invalid value' do
      expect { create_parking_lot(0) }.to raise_error(ArgumentError)
    end
  end

  context 'park a vehicle' do
    it 'successfully' do
      parking_lot = create_parking_lot(2)
      park_msg = park(parking_lot, 'KA-01-HH-1234', 'White')
      expect(park_msg).to eq("Allocated​ ​ slot​ ​ number:​ ​ 1")

      park_msg = park(parking_lot, 'MA-01-HH-1234', 'White')
      expect(park_msg).to eq("Allocated​ ​ slot​ ​ number:​ ​ 2")
    end

    it 'fails when parking lot is full' do
      parking_lot = create_parking_lot(2)
      park(parking_lot, 'KA-01-HH-1234', 'White')
      park(parking_lot, 'KA-02-HH-1234', 'White')
      park_msg = park(parking_lot, 'KA-02-HH-1234', 'White')
      expect(park_msg).to(eq("Sorry, parking lot is full"))
    end
  end

  context 'leave a parking space' do
    it 'successfully' do
      parking_lot = create_parking_lot(2)
      park(parking_lot, 'KA-01-HH-1234', 'White')
      msg = leave(parking_lot, 1)
      expect(msg).to(eq("Slot​ number​ 1 ​is​ ​free"))
    end
  end

  context 'display parking lot status' do
    it 'successfully' do
      parking_lot = create_parking_lot(2)
      park(parking_lot, 'KA-01-HH-1234', 'White')
      park(parking_lot, 'KA-02-HH-1234', 'White')
      status_msg = status(parking_lot)
      expect(status_msg).to include("KA-01-HH-1234", "KA-02-HH-1234")
    end
  end
end
