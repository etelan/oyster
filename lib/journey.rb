class Journey

  # Class Variables
  @@MIN_FARE = 1

  attr_reader :journey, :complete

  def initialize
    @journey = {:start => nil, :end => nil}
    @complete = false
  end

  # This calculates the fare
  def fare
    total = 0
    zone_price = (@journey[:start].zone - @journey[:end].zone).abs
    total = @@MIN_FARE + zone_price
  end


  def completed?
    if (@journey[:start] != nil)
      @complete = true
    end
  end
end
