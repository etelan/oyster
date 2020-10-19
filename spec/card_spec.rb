require 'card'

RSpec.describe Oyster do

  describe "@Balance" do
    it "returns the balance" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "adds number to the balance" do
      expect(subject.top_up(2)).to eq "Your balance is now: £#{subject.balance}"
    end
  end

  describe "#top_up" do
    it "error if over max when trying to top up" do
      expect { subject.top_up(91) }.to raise_error("Can't Top Up - Over Max £90")
    end
  end

end
