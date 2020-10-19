require_relative 'journey_log'


class Oyster
  attr_reader :balance, :start_station, :journey_log

  # Constants - Class
  @@MAX_BALANCE = 90
  @@MIN_FARE = 1
  @@PENALTY = 6


  # Set initial variables
  def initialize()
    @balance = 0
    @journey_log = JourneyLog.new
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

    # Set start station if have money
    @balance >= @@MIN_FARE ? @journey_log.start_journey(station) : raise("You cannot cover the minimum fare")

    # Puts Message
    "You have touched in at #{station}"
  end

  def touch_out(station)
    if check_pentalty
      charge_penalty
    else
      @journey_log.finish_journey(station)
      deduct(@journey_log.current_journey.fare)

      # Puts Message
      "You have touched out at #{station}"
    end
  end

  def in_journey?
    !(@journey_log.current_journey.complete)
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

    def check_pentalty
      @journey_log.current_journey == nil
    end

    def charge_penalty
      deduct(@@PENALTY)
    end



end
