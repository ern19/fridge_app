require_relative '../config/environment'
require_relative '../app/models/fridge'

# puts Fridge.select("name")
# puts Fridge.create(location: "rec room", size: 100, brand: "GE", has_food: true, has_drinks: false)
# puts Fridge.last.delete

def showFridges
    fridges = Fridge.all
    fridges.each do |fridge|
        puts "Your #{fridge.brand} is in the #{fridge.location}"
    end
end

def addFridge
    puts "Wheres the fridge?"
    location = gets.chomp
    puts "What's the brand"
    brand = gets.chomp
    puts Fridge.create(location: "#{location}", brand: "#{brand}")
end
my_str = %q(Welcome to the fridge tracker
What you tryna do?
1. List all fridges
2. Add a fridge
3. Delete a fridge
)

def deleteFridge
    puts "Which number fridge do you want to remove(give number)"
        showFridges
        delete = gets.chomp
        Fridge.find(delete).destroy
        puts "Fridge #{delete} has exploded"
end
puts my_str
user_decision = gets.chomp
user_decision = user_decision.to_i

if user_decision == 1
    showFridges
end

if user_decision == 2
    addFridge
end

if user_decision == 3
    deleteFridge
end

my_str_2 = %q(
    4. View all food items from a specific fridge
5. Add food to a fridge
6. Eat some food from the fridge
7. View all drinks in a fridge
8. Add a drink to the fridge
9. Consume part of a drink
10. Consume all of a drink from the fridge)