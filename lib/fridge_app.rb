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
4. View all food items from a specific fridge
5. Add food to a fridge
6. Eat some food from the fridge
7. View all drinks in a fridge
8. Add a drink to the fridge
9. Consume part of a drink
10. Consume all of a drink from the fridge
)

def deleteFridge
    puts "Which number fridge do you want to remove(give number)"
        showFridges
        delete = gets.chomp
        Fridge.find(delete).destroy
        puts "Fridge #{delete} has exploded"
end

def viewFoodItems
    puts "Which fridge would you like to open?"
    fridgeId = gets.chomp
    foodInFridge = Food.where("fridge_id = '#{fridgeId}'")
    foodInFridge.each do |food|
        puts "You have #{food.name}"
    end
end

def addSomeFood
    puts "Which fridge?"
    fridge_id = gets.chomp
    puts "What is it?"
    food_name = gets.chomp
    puts "How much?"
    food_weight = gets.chomp
    Food.create(name: "#{food_name}", weight: "#{food_weight}", fridge_id: "#{fridge_id}")
end

def eatSomeFood
    puts "Which fridge?"
    fridge_id = gets.chomp
    puts "Whatchu tryna eat?"
    food_name = gets.chomp
    eaten_food = Food.where("name = '#{food_name}'")
    eaten_food.destroy_all
    puts "Slow down man, you're gonna get a stomacheache."
end

def viewDrinks
    puts "Which fridge?"
    fridge_id = gets.chomp
    drinks = Drink.all
    drinks.each do |drink|
        puts "Fridge #{fridge_id} has #{drink.name}"
    end
end

def addADrink
    puts "Which fridge?"
    fridge_id = gets.chomp
    puts "What is it?"
    drink_name = gets.chomp
    puts "How much?"
    drink_size = gets.chomp.to_i
    Drink.create(name: "#{drink_name}", size: "#{drink_size}", fridge_id: "#{fridge_id}")
end

def drinkPartOfADrink
    viewDrinks
    puts "Whatcha drinkin?"
    drink = gets.chomp
    user_is_drinking = Drink.where("name = '#{drink}'")
    puts "You grabbed '#{user_is_drinking.name}'. How much do you drink? (in oz)"
    how_much = gets.chomp.to_i
    how_much_is_left = user_is_drinking.size - how_much 
    user_is_drinking.update(size: "#{how_much_is_left}")
end

def chugADrink
    viewDrinks
    puts "Whatcha drinking?"
    drink = gets.chomp
    user_is_drinking = Drink.where("name = '#{drink}'")
    puts "You chugged '#{user_is_drinking.name}'. Slow down, broseph"
    user_is_drinking.destroy_all
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

if user_decision == 4 
    viewFoodItems
end

if user_decision == 5
    addSomeFood
end

if user_decision == 6
    eatSomeFood
end

if user_decision == 7
    viewDrinks
end

if user_decision == 8 
    addADrink
end

if user_decision == 9
    drinkPartOfADrink
end

if user_decision == 10
    chugADrink
end