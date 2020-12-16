class Card
  @@numeric_ranks = (2..10)
  @@ranks= {
    jack: 11,
    queen: 12,
    king: 13,
    ace: 14
  }


  def initialize(rank: , suit:)
    
    @rank = define_rank(rank)

    @suit = suit
  end

  def rank
    @rank
  end

  def suit
    @suit
  end

  def ==(card)
    self.rank == card.rank && self.suit == card.suit
  end

  def > (card)
    self.rank > card.rank
  end

  def print
    r = if @@numeric_ranks.include?(@rank)
      @rank
    else
      @@ranks.key(@rank).to_s[0].capitalize
    end
    "#{r}#{self.suit[0].capitalize}"
  end

  private
    def define_rank(rank)
      @rank = if @@ranks.include?(rank)
        @@ranks[rank]
      elsif @@numeric_ranks.include?(rank)
        rank
      else
        # 0
        raise(ArgumentError.new("Unknown rank"))
      end
    end
end

card = Card.new(rank: :jack, suit: :hearts)