# Task

# Creating the class for Parking Management
class ParkingManagement
	def initialize(input)
		size = input.split(",")
		@space = {
			"small" => {
				"size" => size[0].to_i,
				"license_plate_stored" => []
			},
			"medium" => {
				"size" => size[1].to_i,
				"license_plate_stored" => []
			},
			"large" => {
				"size" => size[2].to_i,
				"license_plate_stored" => []
			}
		} 
	end

	# Method for admitting the car
	def admit_the_car(license_plate,carsize)
    case carsize
      when "s" 
        if @space["small"]["license_plate_stored"].count < @space["small"]["size"]
          @space["small"]["license_plate_stored"] << license_plate
        elsif @space["medium"]["license_plate_stored"].count < @space["medium"]["size"]
          @space["medium"]["license_plate_stored"] << license_plate          
        elsif @space["large"]["license_plate_stored"].count < @space["large"]["size"]
          @space["large"]["license_plate_stored"] << license_plate                    
        else
          puts "We can't store the car , no space left"
        end

      when "m"
        if @space["medium"]["license_plate_stored"].count < @space["medium"]["size"]
          @space["medium"]["license_plate_stored"] << license_plate          
        elsif @space["large"]["license_plate_stored"].count < @space["large"]["size"]
          @space["large"]["license_plate_stored"] << license_plate                    
        else
          puts "We can't store the car , no space left"
        end
      when 'l'
        if @space["large"]["license_plate_stored"].count < @space["large"]["size"]
          @space["large"]["license_plate_stored"] << license_plate                    
        else
          puts "We can't store the car , no space left"
        end
      else
        pp "Please enter a valid carsize"
    end
	end

	# Method for exitting the car
	def exit_the_car(license_plate)
    @space.each { |k,v|
    	if @space[k]["license_plate_stored"].include?(license_plate) 
    	 @space[k]["license_plate_stored"].delete(license_plate) 
    	 puts "We Successfully remove the car"
    	 return
    	end
    }
    puts "Could not find the car in parking lot"
	end

  # Printing the current state
  def print_current_state
    puts "We have \tSMALL = #{@space["small"]["license_plate_stored"].count} , MEDIUM = #{@space["medium"]["license_plate_stored"].count} , LARGE = #{@space["large"]["license_plate_stored"].count}"
  end
end


puts "First value is the number of small carsize lot available\nSecond value is the number of medium carsize lot available\nThird value is the number of Large carsize lot available"
print "You are the manager, Please enter the size of parking lot as plain text, eg. 1,2,3, \nSize = "
# Getting the parking lot size
input = gets.chomp()
# Inititialise the object
new_managed_parking = ParkingManagement.new(input)

puts "Good, You are all set, Press 1 to admit a car, Press 2 to exit car and 0 to exit the program"


loop do
	# getting user input 
	print "Input : "
	choice = gets.chomp
	# bnreak condition if user wants to exit
	break if choice == '0'

	if choice == '1'
    puts "Please enter the Number/License plate and then size of car seperated by comma , eg. IND123,S"
    entry_description = gets.chomp
    entry_description = entry_description.split(",")
    new_managed_parking.admit_the_car(entry_description[0],entry_description[1].downcase)
    new_managed_parking.print_current_state
	elsif choice == '2'
		puts "Please enter the Number/License plate of the car you want to remove from parking lot"
    remove_description = gets.chomp
    new_managed_parking.exit_the_car(remove_description)
    new_managed_parking.print_current_state
	else
		puts "please enter a valid option"
	end
	

end

