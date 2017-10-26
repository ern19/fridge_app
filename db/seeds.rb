# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Fridge.destroy_all

maytag = Fridge.create(location: "kitchen", size: 200, brand: "Maytag", has_food: true, has_drinks: false)
ge = Fridge.create(location: "basement", size: 200, brand: "GE", has_food: false, has_drinks: true)

Food.create(name: "steak", weight: 24, is_vegan: false, time_stamp: Date.new, fridge_id: maytag.id)
Food.create(name: "pizza", weight: 30, is_vegan: false, time_stamp: Date.new, fridge_id: maytag.id)

Drink.create(name: "Olde English", size: 40, is_booze: true, fridge_id: ge.id, )
Drink.create(name: "Apple Juice", size: 32, is_booze: false, fridge_id: ge.id, )


