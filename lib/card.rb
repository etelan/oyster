class Oyster
  attr_reader :balance

  # Constants - Class
  @@MAX_BALANCE = 90

  # Set initial variables
  def initialize(bal = 0)
    @balance = bal
  end

  # Top up Method
  def top_up(money)
    @balance + money > @@MAX_BALANCE ? raise("Can't Top Up - Over Max £90") : @balance += money
    "Your balance is now: £#{self.balance}"
  end
end
