require "card"

RSpec.describe Card do

  def card(params = {}) 
    defaults = {
      rank: 6, 
      suit: :hearts
    }

    described_class.new(**defaults.merge(params))
  end

  describe "#rank" do
    it "a card has rank" do
      expect(card(rank: 7).rank).to eql(7)
    end

    it "a jack has rank of 11" do
      expect(card(rank: :jack).rank).to eql(11)
    end

    it "a unknown rank has rise an error" do
      expect{ card(rank: :foo) }.to raise_error(ArgumentError, "Unknown rank")
    end
  end

  describe "#suit" do
    it "a card has suit" do
      expect(card(suit: :hearts).suit).to eql(:hearts)
    end
  end

  context "equation" do
    it "card eqls to itself" do
      card1 = card()
      card2 = card()
  
      expect(card1).to eq(card2)
  
    end
  
    it "a 10 higher than a 7" do
      card7 = card(rank: 7)
      card10 = card(rank: 10)
  
      expect(card10).to be > card7
    end
  
    it "a ace higher than a 7" do
      card7 = card(rank: 7, suit: :hearts)
      card_ace = card(rank: :ace, suit: :hearts)
  
      expect(card_ace).to be > card7
    end
  
    it "a ace higher than a jack" do
      card_jake = card(rank: :jack, suit: :hearts)
      card_ace = card(rank: :ace, suit: :hearts)
  
      expect(card_ace).to be > card_jake
    end
  
    it "a ace h higher than a 7 d" do
      card7 = card(rank: 7, suit: :hearts)
      card_ace = card(rank: :ace, suit: :diamonds)
  
      expect(card_ace).to be > card7
    end
  end

  describe "#print" do
    it "prints card 6 hearts -> 6H" do
      card6 = card()
      expect(card6.print).to eql("6H")
    end

    it "prints card 6 diamonds -> 6D" do
      card6 = card(suit: :diamonds)
      expect(card6.print).to eql("6D")
    end

    it "prints card Ace diamonds -> AD" do
      card_ace = card(rank: :ace, suit: :diamonds)
      expect(card_ace.print).to eql("AD")
    end

  end

end
