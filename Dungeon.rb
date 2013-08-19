class Dungeon
	attr_accessor :player

	#initialize the game
	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	#add rooms
	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)
	end

	#start the game
	def start(location)
		@player.location = location
		show_current_description
	end

	#show the desription
	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description
	end

	def find_room_in_dungeon(reference)
		@rooms.detect {|room| room.reference == reference}
	end

	def find_room_in_direction(direction)
		find_room_in_dungeon(@player.location).connections[direction]
	end

	#move
	def go(direciton)
		puts "You go "+direciton.to_s
		@player.location = find_room_in_direction(direciton)
		show_current_description
	end

	#data of players
	#Player = Struct.new(:name, :location)//if there isn't any logical function
	class Player
		attr_accessor :name, :location

		def initialize(name)
			@name = name
		end
	end

	#data of rooms
	#Room = Struct.new(:reference, :name, :description, :connections) //if there isn't any logical function
	class Room
		attr_accessor :reference, :name, :description, :connections

		def initialize(reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections #it's a hash just like {:west => :smallcave}
		end

		def full_description
			@name + "\n \nYou are in " + @description
		end
	end

end



#Play
my_dungeon = Dungeon.new("Neo")
my_dungeon.add_room(:largecave,"Large Cave","a large cavernous cave",{:west=>:smallcave})
my_dungeon.add_room(:smallcave,"Small Cave","a small, claustrophobic cave",{:east=>:largecave})
my_dungeon.start(:largecave)
------WebKitFormBoundaryZPGo0dr2oo5U8qfB
Content-Disposition: form-data; name="mode"

formupload