require 'pry'
class Gossip
	attr_accessor :author, :content

	def initialize (author, content)
		@content = content
		@author = author
	end

	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
  		csv << [@author, @content]
		end
	end

	def self.all
		all_gossips = Array.new
		CSV.read("./db/gossip.csv") do |csv_line|
			all_gossips << Gossip.new(csv_line[0], csv_line[1])
		end
		all_gossips
	end
end

binding.pry


