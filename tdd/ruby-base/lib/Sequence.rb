class Sequence
  attr_reader :value

  def initialize(number) 
    @value = [number]
  end

  def getNext
    i = 0
    sum = 1
    res = []
    while (i < @value.length-1) do
      if (@value[i] == @value[i+1])
        sum += 1
      else 
        res.push(sum)
        res.push(@value[i])
        sum = 1
      end
      i += 1
    end
    res.push(sum)
    res.push(@value[i])
    @value = res
      
  end

  
  def to_string
    i = 0
    res = ""
    while (i < @value.length) do
      res += @value[i].to_s
      i += 1
    end
    return res
  end
  
end

def getSequence(amount)
  str = ''
  if (amount > 0)
      s = Sequence.new(1)
      i = 0
      while (i < amount) 
          str += "#{s.to_string}\n"
          s.getNext
          i += 1
      end
  end
  str.chomp
end

# s = Sequence.new(21);
# puts (s.getNext)

amount = gets.encode("UTF-8").chomp.to_i
puts getSequence(4)