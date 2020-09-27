require_relative "./data.rb"

current = File.dirname(__FILE__)

path = current + "/data_from/data.txt"
path_to = current + "/data_from/data_sorted.txt"


data = DataF.new(path)

puts "Enter number of column you want to sort by:"
data.columns.each_with_index do |c, i|
	puts "#{i} #{c}"
end

column = gets.chomp.to_i

persons = data.public_send("sort_by", column)

data.to_file(current, column, persons)