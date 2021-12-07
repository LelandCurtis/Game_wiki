class Level < ApplicationRecord
  has_many :monsters

  def enraged_monsters
    monsters.enraged_monsters
  end

  def monsters_by_name
    monsters.by_name
  end
end
