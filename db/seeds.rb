# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

levels = [
  ["Level_1", false, 5],
  ["Level_2", false, 10],
  ["Level_3", true, 15]
]
#Level.create(name: "Level 1", boss: false, difficulty: 5)
#Level.create(name: "Level 2", boss: false, difficulty: 10)
#Level.create(name: "Level 3", boss: true, difficulty: 15)

monsters = [
  ["Monster_1", false, 10, 1],
  ["Monster_2", true, 7, 1],
  ["Monster_3", true, 8, 2],
  ["Monster_4", false, 12, 2],
  ["Monster_5", false, 11, 3],
  ["Monster_6", true, 10, 3]
]

roles = [
  ['role_1', true, 20],
  ['role_2', true, 25],
  ['role_3', false, 30]
]

weapons = [
  ['weapon_1', false, 0.5, 30, 1],
  ['weapon_2', false, 0.25, 15, 1],
  ['weapon_3', true, 1.0, 45, 2],
  ['weapon_4', true, 1.5, 70, 2],
  ['weapon_5', false, 1.0, 80, 3],
  ['weapon_6', true, 0.5, 20, 3]
]

levels.each do |name, boss, difficulty|
  Level.create(name: name, boss: boss, difficulty: difficulty)
end

monsters.each do |name, enraged, health, levels_id|
  Monster.create(name: name, enraged: enraged, health: health, levels_id: levels_id)
end

roles.each do |name, unlocked, health|
  Role.create(name: name, unlocked: unlocked, health: health)
end

weapons.each do |name, ranged_attack, fire_rate, damage, roles_id|
  Weapon.create(name: name, ranged_attack: ranged_attack, fire_rate: fire_rate, damage: damage, roles_id: roles_id)
end
