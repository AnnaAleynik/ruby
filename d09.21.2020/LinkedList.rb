require "./Node.rb"

class LinkedList
	include Enumerable

	attr_reader :tail, :head, :node, :size

	
	def initialize
		@head = nil
		@size = 0
	end

	def each
		node = self.head
		while (node != self.tail) do
			yield(node)
			node = node.next
		end
		yield(node)
	end

	def add(value)

		@size += 1

		if @head == nil
			@head = Node.new(value, nil)
			@tail = @head
			return
		end

		node = Node.new(value, @tail)
		@tail.next = node
		@tail = node
	end

	def [](n)
		if n >= @size || n < 0
			raise IndexError.new "List has #{@size} elements."
		end

		node = @head

		if n == 0
			return node.value
		end


		n.times do
			node = node.next
		end

		return node

	end

	def []=(n, value)
		node = self[n]
		node.value = value
	end


	def to_s
		node = @head
		string = ""
		self.each do |item|
			string += "#{item.to_s} "
		end
		return string
	end


end

list = LinkedList.new
list.add(1)
list.add(2)
list.add(3)
list.add(4)



puts list.to_s


# three methods of Enumerable

puts list.map { |e| e.value + 3 }
puts

puts "sum: #{list.sum { |e| e.value}}"

puts "max: #{list.max}"

puts list[0] #1
puts list[3] #4

list [3]= 6
puts list[3]
puts list[4] #List has 4 elements. (IndexError)

