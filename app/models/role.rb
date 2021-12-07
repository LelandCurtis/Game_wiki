class Role < ApplicationRecord
  has_many :weapons

  def ranged_attacked_weapons
    weapons.ranged_attacked_weapons
  end

  def weapons_by_name
    weapons.by_name
  end
end
