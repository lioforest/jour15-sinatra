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

def self.update(id_recu, author, content)
		newgossip = []
		compteur=0
		valeur_test = id_recu
		csv = CSV.read("./db/gossip.csv").each do |gossip|
			print "valeur test"
			puts valeur_test
			print "compteur"
			puts compteur

			if valeur_test == compteur then
				newgossip << [author, content]
			else
				newgossip << gossip
			end
			compteur+=1
		end

		CSV.open('./db/gossip.csv', 'w+') do |csv_object|
			newgossip.each { |gossip|	csv_object << gossip}
		end
end

end