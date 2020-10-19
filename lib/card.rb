class Oyster
  attr_reader :balance

  # Constants - Class
  @@MAX_BALANCE = 90
  @@MIN_FARE = 0


  # Set initial variables
  def initialize()
    @balance = 0
    @start_station = nil
  end

  # Top up Method
  def top_up(money)
    @balance + money > @@MAX_BALANCE ? raise("Can't Top Up - Over Max £90") : @balance += money
    "Your balance is now: £#{self.balance}"
  end

  def pay(money)
    @balance - money < 0 ? raise("Can't Top Up - Would go in debt") : @balance -= money
    "Your balance is now: £#{self.balance}"
  end

  def touch_in(station)
    @balance != @@MIN_FARE ? @start_station = station : raise("You cannot cover the minimum fare")
    "You have touched in at #{station}"
  end

  def touch_out(station)
    @start_station = nil
    "You have touched out at #{station}"
  end

  def in_journey?
    @start_station != nil
  end


end
