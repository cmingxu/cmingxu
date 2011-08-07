class Waiter

  attr_accessor :park

  def initialize(park)
    @park = park
  end

  def park(car)
    lot = self.find_parking_lot
    lot.parkBy(car)
  end

  def find_parking_lot
    @park.parking_lots.detect do |lot|
      !lot.occupied?
    end
  end
end
