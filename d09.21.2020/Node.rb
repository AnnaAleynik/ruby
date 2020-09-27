class Node

	# include Comparable

	attr_reader :next, :prev, :value
	attr_writer :next, :prev, :value

	def initialize(value, prev) 
		@value = value
		@next = nil
		@prev = prev
	end

	def to_s
		@value.to_s
	end

	def <=>(other)
		@value <=> other.value
	end


end