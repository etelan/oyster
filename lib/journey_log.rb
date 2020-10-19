require_relative 'journey'

class JourneyLog

  attr_reader :current_journey, :journeys

  def initialize
    @journeys = []
    @current_journey = nil
  end

  def start_journey(station)
    # Make a new journey and set start station
    show_current_journey
    @current_journey.journey[:start] = station
  end

  def finish_journey(station)

    # Set end station and check if completed
    @current_journey.journey[:end] = station
    @current_journey.completed?

    # Add to the log
    @journeys << @current_journey
  end



  private
    def show_current_journey
      if @current_journey == nil then @current_journey = Journey.new end
      return @current_journey
    end

end
