class Field
	@@fields = []
	@@total_harvested = 0
	def initialize(type,size)
		@type = type
		@size = size
	end

	def field_type
		@type
	end
	def field_size
		@size
	end
	def self.create(type,size)
		new_field = Field.new(type,size)
		@@fields << new_field
		return new_field
	end

	def self.harvest_fields
		harvest = 0
		@@fields.each do |field|
			if field.field_type == "corn"
				harvest = 20 * field.field_size
			else
				harvest = 100 * field.field_size
			end
			@@total_harvested += harvest
			puts "Harvesting #{harvest} food from #{field.field_size} hectare #{field.field_type} field."
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
			if field.field_type == "corn"
				puts "#{field.field_size} hectares of tall green stalks rustling in the breeze fill your horizon."
			else
				puts "The sun hangs low, casting an orange glow on a sea of #{field.field_size} hectares of wheat."
			end
		end
		
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
		puts "What kind of field is it: corn or wheat?"
		type = gets.chomp
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
