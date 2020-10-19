require 'journey_log'

RSpec.describe JourneyLog do

  # Doubles
  let(:station) {double("Blackfriars")}
  let(:station2) {double("Paddington")}

  describe 'start_journey' do
    it 'Sets the start location' do
      subject.start_journey(station)
      expect(subject.current_journey.journey[:start]).to eql station
    end
  end

  describe 'finish_journey' do
    it 'Sets the end location' do
      subject.start_journey(station)
      subject.finish_journey(station)
      expect(subject.current_journey.journey[:end]).to eql station
    end

    it 'Sets complete if full journey' do
      subject.start_journey(station)
      subject.finish_journey(station2)
      expect(subject.current_journey.complete).to eql true
    end
  end


end
