class AnotherSeq 
  attr_reader :value

  def initialize(value) 
    @value = value
  end

  def next 
    @value.chars.chunk{ |n| n}.map {|a| [a.last.size, a.first]}.join
   end
 
end
