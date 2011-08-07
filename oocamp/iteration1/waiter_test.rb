require 'test/unit'
require 'park'
require 'car'
require 'parking_lot'
require 'waiter'

class WaiterTest < Test::Unit::TestCase
  def test_should_park_by_waiter
    @car = Car.new
    @park = Park.new(1)
    @waiter = Waiter.new(@park)
    lot = @park.parking_lots.first
    @waiter.park(@car)

    assert @car.is_parked?
  end

  def test_should_not_park_by_wait_when_full
    @car = Car.new
    @park = Park.new(1)
    @waiter = Waiter.new(@park)
    lot = @park.parking_lots.first
    lot.parkBy(@car)

    @car2 = Car.new
    @waiter.park(@car2)
    assert !@car2.is_parked?
  end
end
