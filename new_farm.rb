
class Field
	@@fields = []
	@@total_harvested = 0
	@@all_types = ["Corn", "Wheat", "Watermelon"]

	def field_type
		@type
	end
	def field_size
		@size
	end

	def harvest 
		return food * field_size
	end
	def self.create(type,size)
		@@all_types.each do |field_type|
			if field_type == type
				new_field = Kernel.const_get(field_type).new(size)
				@@fields << new_field
				return new_field
			end
		end
	end

	def self.harvest_fields
		@@fields.each do |field|
			field.harvest
			@@total_harvested += field.harvest
			puts "Harvesting #{field.harvest} food from #{field.field_size} hectare #{field.field_type} field."
		end
		return @@total_harvested
	end

	def self.status
		@@fields.each do |field|
			puts "#{field.field_type} field is #{field.field_size} hectares"
		end
		return @@total_harvested
	end

	def self.descriptions
		@@fields.each do |field|
			field.description
		end
	end
end

# TYPES OF FIELDS
class Corn < Field
	def initialize(size)
		@type = "corn"
		@size = size
	end

	def food
		@food = 20
	end

	def description
		puts "#{@size} hectares of tall green stalks rustling in the breeze fill your horizon."
	end
end

class Wheat < Field
	def initialize(size)
		@type = "wheat"
		@size = size
	end

	def food
		@food = 100
	end

	def description
		puts "The sun hangs low, casting an orange glow on a sea of #{@size} hectares of wheat."
	end
end

class Watermelon < Field
	def initialize(size)
		@type = "Watermelon"
		@size = size
	end

	def food
		@food = 50
	end 

	def description
		puts "The earth rumbles as #{@size} hecatare of watermelons crush the bodies of millions."
	end
end

class Farm
	def main_menu
	    while true 
	      print_options
	      get_option
	    end
  	end

	def print_options
		puts '-------------------------------'
	    puts 'Options:'
	    puts 'field -> adds a new field'
	    puts 'harvest -> harvests crops and adds to total harvested'
	    puts 'status -> displays some information about the farm'
	    puts 'relax -> provides lovely descriptions of your fields'
	    puts 'exit -> exits the program'
	    puts '-------------------------------'
	end

	def get_option
		print ">> "
		selection = gets.chomp
		case selection
		when "field" then add_field
		when "harvest" then harvest_field
		when "status" then status_field
		when "relax" then descriptions
		when "exit" then burn_farm
		else
			puts "invalid input"
		end
	end

	def add_field
		puts "What kind of field is it: corn, wheat, or watermelon?"
		type = gets.chomp
		type.capitalize!
		puts "How large is the field in hectares?"
		size = gets.chomp.to_i
		Field.create(type,size)
	end

	def harvest_field
		puts "The farm has harvested #{Field.harvest_fields} food so far."
	end

	def status_field
		puts "The farm has harvested #{Field.status} food so far."
	end

	def descriptions
		Field.descriptions
	end

	def burn_farm
		abort("Destroying the evidence.")
	end
end

spooky_farm = Farm.new
spooky_farm.main_menu
