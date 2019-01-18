class Vehicle
  attr_accessor :color, :reg_num, :parking_spot, :parking_level

  def initialize(reg_num, color)
    @reg_num = reg_num
    @color = color
  end
end
