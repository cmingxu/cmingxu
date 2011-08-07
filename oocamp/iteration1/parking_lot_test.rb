require 'test/unit'
require 'parking_lot'
require 'car'

class ParkingLotTest < Test::Unit::TestCase
  

  def test_should_be_created
    assert ParkingLot.new
  end

  def test_new_created_parking_lot_should_unoccupied
    assert  !ParkingLot.new.occupied
  end
#
#  def test_parking_lot_occupied_can_be_toggled
#    @parking_lot = ParkingLot.new
#    assert @parking_lot.toggle
#    assert @parking_lot.occupied
#    @parking_lot.toggle
#    assert !@parking_lot.occupied
#  end
#

  def test_parkedBy_a_car
    @car = Car.new
    @parking_lot = ParkingLot.new
    assert @parking_lot.parkedBy(@car)
    assert !@parking_lot.parkedBy(@car)
    assert @car.is_parked?
  end

end
