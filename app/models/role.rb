class Role < ApplicationRecord
  has_many :weapons

  def ranged_attacked_weapons
    weapons.ranged_attacked_weapons
  end

  def weapons_by_name
    weapons.by_name
  end

  def remove_damage_below(threshold)
    weapons.where("damage > #{threshold}")
  end

  def self.by_weapon_count
    #roles = Role.all.order('role.weapons')
    roles = Role.select('roles.*, COUNT(weapons.id) AS weapons_count').joins(:weapons).order(:weapons_count).group(roles.id)
    require "pry"; binding.pry
  end
end
