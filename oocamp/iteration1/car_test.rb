require 'test/unit'
require 'car'
require 'parking_lot'

class CarTest < Test::Unit::TestCase
  def test_can_create_new_car
    assert Car.new 
  end

  def test_car_have_parked_attribute
    @instance  = Car.new
  end

  def test_parking_lot_should_be_empty_afer_unpark
    @car = Car.new
    @parkinglot = ParkingLot.new
    @car.park @parkinglot
    @car.unpark 
    assert @parkinglot.empty?
  end
end


#parking lot 能停其他车
#车不能取走两次


#取回来的车是我的车


