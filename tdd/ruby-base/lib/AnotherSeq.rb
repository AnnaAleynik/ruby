class AnotherSeq 
  attr_reader :value

  def initialize(value) 
    @value = value
  end

  def next 
    @row = @value.chars.chunk{ |n| n}.map {|a| [a.last.size, a.first]}.join
    self
  end

  def to_s
    @row
  end
 
end
