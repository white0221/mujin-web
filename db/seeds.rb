# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Add Test Data"
User.create(
  user_name: "admin",
  email: "admin@admin.com",
  password: "admincom",
  password_confirmation: "admincom",
  admin_flag: true
)

name = ['Milk', 'Coffee', 'Pan', 'Potech','Sweets']
value = ['120', '680', '90', '80', '240']
5.times do |i|
  Item.create(
    item_name: name[i],
    value: value[i],
    aruco_id: i
  )
end

puts "Add history Data"
item = ['Coffee', 'Sweets']
history = History.create(
  user_id: 3,
  responce: true
)
item.length.times do |i|
  item = Item.find_by(item_name: item[i])
  HistoryDetail.create(
    history_id: history,
    item_id: item,
    volume: 1
  )
end

puts "COMPLETE"