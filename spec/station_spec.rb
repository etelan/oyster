require 'station'

RSpec.describe Station do

  # Doubles
  let(:station) {double("Blackfriars")}
  let(:station2) {double("Paddington")}

  describe "#Initialize" do
    it "sets name" do
      station = Station.new("KX", 1)
      expect(station.name).to eq "KX"
    end

    it "sets zone" do
      station = Station.new("KX", 1)
      expect(station.zone).to eq 1
    end

  end
end
