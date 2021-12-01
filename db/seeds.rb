# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

levels_list = [
  [1, "Level_1", false, 5],
  [2, "Level_2", false, 10],
  [3, "Level_3", true, 15],
]
#Level.create(name: "Level 1", boss: false, difficulty: 5)
#Level.create(name: "Level 2", boss: false, difficulty: 10)
#Level.create(name: "Level 3", boss: true, difficulty: 15)

monster_list = [
  [1, "Monster_1", false, 10],
  [1, "Monster_2", true, 7],
  [2, "Monster_3", true, 8],
  [2, "Monster_4", false, 12],
  [3, "Monster_5", false, 11],
  [3, "Monster_6", true, 10],
]

roles = [
  [1, 'role_1', true, 20],
  [2, 'role_2', true, 25],
  [3, 'role_3', false, 30]
]

weapons = [
  [1, 'weapon_1', false, 0.5, 30]
  [1, 'weapon_2', false, 0.25, 15]
  [2, 'weapon_3', true, 1.0, 45]
  [2, 'weapon_4', true, 1.5, 70]
  [3, 'weapon_5', false, 1.0, 80]
  [3, 'weapon_6', true, 0.5, 20]
]
levels_list.each do |name, boss, rating|
  #Levels.create(name: name, boss: boss, rating: rating)
end
