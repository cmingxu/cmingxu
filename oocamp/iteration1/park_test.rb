require 'test/unit'
require 'park'
require 'car'
require 'parking_lot'

class ParkTest < Test::Unit::TestCase

  def test_should_show_full_message
    @park = Park.new(1)
    @park.parking_lots.each do |lot|
      @car = Car.new
      lot.parkedBy(@car)
    end

    assert_equal @park.message, "车位满"
  end

  def test_should_check_parking_lot_all_occupied
    @park = Park.new(1)
    @park.parking_lots.each do |lot|
      @car = Car.new
      lot.parkedBy(@car)
    end

    assert @park.is_full?
  end

  def test_should_hide_full_message
    @park = Park.new(1)
    cars = []
    @park.parking_lots.each do |lot|
      car = Car.new
      lot.parkedBy(car)
      cars << car
    end
    assert @park.is_full?
    assert_equal @park.message, "车位满"

    cars[0].unpark
    
    assert_equal @park.message, ""


    




  end
end


