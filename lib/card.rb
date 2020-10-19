require_relative 'journey'


class Oyster
  attr_reader :balance, :start_station, :journeys

  # Constants - Class
  @@MAX_BALANCE = 90
  @@MIN_FARE = 1
  @@PENALTY = 6


  # Set initial variables
  def initialize()
    @balance = 0
    @journeys = []
    @current_journey = nil
  end

  # Top up Method
  def top_up(money)
    # If it won't go over the balance, top up
    @balance + money > @@MAX_BALANCE ? raise("Can't Top Up - Over Max £90") : @balance += money
    print_balance
  end

  def pay(money)
    # If won't go under 0, pay for it
    @balance - money < 0 ? raise("Can't Top Up - Would go in debt") : deduct(money)
    print_balance
  end



  def touch_in(station)
    # New journey
    @current_journey = Journey.new

    # Set start station if have money
    @balance >= @@MIN_FARE ? @current_journey = Journey.new : raise("You cannot cover the minimum fare")
    @current_journey.start_journey(station)

    # Puts Message
    "You have touched in at #{station}"
  end

  def touch_out(station)
    if check_pentalty
      charge_penalty
    else
      @current_journey.finish_journey(station)
      add_journey()
      deduct(@current_journey.fare)

      # No longer a journey
      @current_journey = nil

      # Puts Message
      "You have touched out at #{station}"
    end
  end

  def in_journey?
    !(@current_journey.complete)
  end

  private

    # Deduct without checking
    def deduct(money)
      @balance -= money
    end

    # Prints the balance in a nice way.
    def print_balance
      "Your balance is now: £#{self.balance}"
    end

    # Add Journey Hash
    def add_journey
      @journeys << @current_journey
    end

    def check_pentalty
      @current_journey == nil
    end

    def charge_penalty
      deduct(@@PENALTY)
    end



end
