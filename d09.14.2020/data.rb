# require_relative 'Person.rb'

class DataF

	attr_accessor :columns, :persons

	def initialize(path)

		if File.exist?(path)
			file = File.open(path, "r:UTF-8")
			lines = file.readlines.map { |line| line.chomp }
			file.close

			@columns = lines[0].split(", ")
			lines.delete_at(0)
			@persons = []

			lines.map do |line|
				@persons << line.split(", ")
	
			end

		end
	end

	def method_missing(method, column)
		new_persons = @persons.sort { |x, y|	x[column]<=>y[column] }
		new_persons
	end

	# def sort_by(column)
	# 	persons = @persons.sort { |x, y|	x[column]<=>y[column] }
	# 	new_p
	# end

	def to_file(path, column, lines)
		file = File.open(path + "/data_from/data_sorted_#{column}.txt", "w:UTF-8")
		lines.each do |line| 
			line.each {|x| file.write("#{x}, ")}
			file.write("\n") 
		end
	end

end