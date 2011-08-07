class Car 
  attr_accessor :state, :parking_lot

  def initialize
    @state = :moving
  end

  def is_parked?
    @state == :parked
  end

  def park parking_lot
    @parking_lot = parking_lot
    @state = :parked
  end

  def unpark
    @parking_lot = nil
    @state = :unpacked
  end
end
