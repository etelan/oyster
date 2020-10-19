require 'card'

RSpec.describe Oyster do

  describe "balance" do
    it "returns the balance" do
      blue_card = Oyster.new
      expect(blue_card.balance).to eq 0
    end
  end

end
