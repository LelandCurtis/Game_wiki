# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

levels_list = [
  ["Level_1", false, 5, "morning", "night"],
  ["Level_2", false, 10, "morning", "night"],
  ["Level_3", true, 15, "morning", "night"],
  ["Level_4", false, 20, "morning", "night"],
  ["Level_5", false, 25, "morning", "night"],
  ["Level_6", true, 30, "morning", "night"]
]

levels_list.each do |name, boss, rating, created_at, updated_at|
  Levels.create(name: name, boss: boss, rating: rating, created_at: created_at, updated_at: updated_at)
end
