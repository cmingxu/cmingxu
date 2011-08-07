require 'parking_lot'

class Park
  attr_accessor :parking_lots

  def initialize count
    @parking_lots = []
    count.times  do 
      parking_lots << ParkingLot.new
    end
  end

  def is_full?
    parking_lots.each do |lot|
      return false if !lot.occupied?
    end
  end

  def message
    return "车位满" if is_full?  
  end

end
