# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Add Test Data"
name = ['Milk', 'Coffee', 'Pan', 'Potech','Sweets']
value = ['120', '680', '90', '80', '240']
5.times do |i|
  Item.create(
    item_name: name[i],
    value: value[i],
    aruco_id: i
  )
end