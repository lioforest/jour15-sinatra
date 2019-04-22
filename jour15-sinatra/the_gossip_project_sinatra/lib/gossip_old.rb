class Gossip

	attr_accessor :content
	attr_accessor :author


	def initialize(author, content)
	  @content = content
	  @author = author
	end


	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
		csv << [@author, @content]
		end
	end

	def self.all
		all_gossips = []  #on initialise un array vide
		  # va chercher chacune des lignes du csv do
		CSV.read("./db/gossip.csv").each do |csv_line|
			all_gossips << Gossip.new(csv_line[0],csv_line[1])
		end
		return all_gossips
	end

	def self.find(id)
		i = 0
		CSV.read("./db/gossip.csv").each do |csv_line|
			if i == id.to_i
				return Gossip.new(csv_line[0],csv_line[1])
			end
		i += 1
		end

	
	end



	def self.update(gossip_id, author_new_value,content_new_value)
		new_gossips = []  #on initialise un array vide
		  # va chercher chacune des lignes du csv do
		csv = CSV.read("./db/gossip.csv").each do |csv_line, index|

			if index == gossip_id then			
				new_gossips << Gossip.new(author_new_value,content_new_value)
				puts "valeur"
				puts author_new_value
				puts content_new_value
			else
				puts "valeur"
				puts author_new_value
				puts content_new_value
				puts "valeur2"
				puts @author
				new_gossips << Gossip.new(csv_line[0],csv_line[1])
			end


		end
		puts new_gossips
		return new_gossips
	end
end