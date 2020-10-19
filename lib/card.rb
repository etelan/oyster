class Oyster
  attr_reader :balance, :start_station, :journeys

  # Constants - Class
  @@MAX_BALANCE = 90
  @@MIN_FARE = 1


  # Set initial variables
  def initialize()
    @balance = 0
    @start_station = nil
    @journeys = []
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
    @balance >= @@MIN_FARE ? @start_station = station : raise("You cannot cover the minimum fare")
    "You have touched in at #{station}"
  end

  def touch_out(station)
    add_jouney(@start_station, station)
    @start_station = nil
    deduct(@@MIN_FARE)
    "You have touched out at #{station}"
  end

  def in_journey?
    @start_station != nil
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
    def add_jouney(start_station, end_station)
      @journeys << {:start => start_station, :end => end_station}
    end



end
