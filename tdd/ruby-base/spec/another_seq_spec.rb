require 'AnotherSeq'

describe AnotherSeq do
  
  describe "#describe" do
    it "returns next sequence(1)" do
      expect(AnotherSeq.new("1").next).to eql("11")
    end

    it "returns next sequence(2113165)" do
      expect(AnotherSeq.new("2113165").next).to eql("122113111615")
    end
  end

end
