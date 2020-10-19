require 'card'

RSpec.describe Oyster do

  # Doubles
  let(:station) {double("Blackfriars")}
  let(:station2) {double("Paddington")}

  describe "#Initialize" do
    it "sets journey to 0" do
      expect(subject.journeys.count).to eq 0
    end
  end

  describe "#Balance" do
    it "returns the balance" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "adds number to the balance" do
      expect(subject.top_up(2)).to eq "Your balance is now: £#{subject.balance}"
    end

    it "error if over max when trying to top up" do
      expect { subject.top_up(91) }.to raise_error("Can't Top Up - Over Max £90")
    end
  end

  describe "#pay" do
    it "remove number to the balance" do
      subject.top_up(1)
      expect(subject.pay(1)).to eq "Your balance is now: £0"
    end
  end

  describe "#in_journey?" do
    it "Returns true if in transit" do
      subject.top_up(20)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end
  end

  describe "#touch_in" do
    it "Save the touch in station and return to the user" do
      subject.top_up(20)
      expect(subject.touch_in(station)).to eq "You have touched in at #{station}"
    end

    it "Error if not enough touch in cash" do
      expect{subject.touch_in(station)}.to raise_error "You cannot cover the minimum fare"
    end
  end

  describe "#touch_out" do
    it "Leaving Station sets and returns" do
      expect(subject.touch_out(station)).to eq "You have touched out at #{station}"
    end

    it "Expect to pay for the fare when touch out" do
      subject.top_up(2)
      expect {subject.touch_out(station)}.to change{subject.balance}.by(-1)
    end

  end

  describe "Add Journey" do
    it "Touch in and Touch out creates one journey" do
      subject.top_up(20)
      subject.touch_in(station)
      expect {subject.touch_out(station2)}.to change{subject.journeys.count}.by(1)
    end
  end

end
