class ParkingSpot
  attr_accessor :is_available, :number

  def initialize(number)
    @number = number
    @is_available = true
  end
end
