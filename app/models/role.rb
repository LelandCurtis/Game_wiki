class Role < ApplicationRecord
  has_many :weapons

  def weapons_by_name
    weapons.by_name
  end

  def remove_damage_below(threshold)
    weapons.where("damage > #{threshold}")
  end

  def self.by_weapon_count
    roles = Role.select('roles.*, COUNT(weapons.id) AS weapons_count').joins(:weapons).order('weapons_count DESC').group('roles.id')
  end
end
