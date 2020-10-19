class Oyster
  attr_reader :balance

  def initialize(bal = 0)
    @balance = bal
  end

  def top_up(money)
    @balance += money
    "Your balance is now: £#{self.balance}"
  end
end
