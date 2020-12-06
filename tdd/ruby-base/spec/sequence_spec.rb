require 'Sequence'

describe Sequence do
  
  describe "#value" do
    
    it "returns next sequence(1)" do
      expect(Sequence.new(1).value).to eql([1])
    end

  end

  describe "#getNext" do
    it "returns next sequence(1)" do
      expect(Sequence.new(1).getNext).to eql([1,1])
    end
  end

  describe "#toString" do
    it "returns toString(1)" do 
      expect(Sequence.new(1).to_string).to eql("1")
    end
  end

  describe "#getSequence" do
    it "returns getSequence(1)" do
      expect(getSequence(1)).to eql("1")
    end

    it "returns getSequence(4)" do
      expect(getSequence(4)).to eql("1\n11\n21\n1211")
    end
  end
end
