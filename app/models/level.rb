class Level < ApplicationRecord
  has_many :monsters

  def monsters_by_name
    monsters.by_name
  end

  def remove_health_below(health_range)
    monsters.where("health > #{health_range}")
  end

end
