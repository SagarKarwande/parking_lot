class ParkingSpot
  attr_accessor :is_available, :number, :vehicle

  def initialize(number)
    @number = number
    @is_available = true
  end
end
