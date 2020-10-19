class Journey

  attr_reader :journey, :complete

  def initialize
    @journey = {:start => nil, :end => nil}
    @complete = false
  end

  def start_journey(station)
    @journey[:start] = station
  end

  def finish_journey(station)
    @journey[:end] = station
    completed?
  end



  def calculate_fare
  end

  private
    def completed?
      if (@journey[:start] != nil)
        @complete = true
      end
    end
end
