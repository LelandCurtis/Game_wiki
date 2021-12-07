class Weapon < ApplicationRecord
  belongs_to :role

  def self.ranged_attack_weapons
    Weapon.where('ranged_attack = true')
  end
end
