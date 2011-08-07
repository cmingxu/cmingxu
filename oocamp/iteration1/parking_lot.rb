class ParkingLot
  attr_accessor :occupied
  attr_accessor :car
  def initialize
    @occupied = false
  end
  
  def parkedBy(car)
    if(@occupied)
      return false
    else
      @car = car
      @car.park
      @car.parking_lot = self
      @occupied = true
      return true
    end
  end


  def occupied?
    @occupied
  end
end
