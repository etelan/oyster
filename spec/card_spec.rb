require 'card'

RSpec.describe Oyster do

  describe "@Balance" do
    it "returns the balance" do
      blue_card = Oyster.new
      expect(blue_card.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "adds number to the balance" do
      blue_card = Oyster.new
      expect(blue_card.top_up(2)).to eq "Your balance is now: £#{blue_card.balance}"
    end
  end

end
