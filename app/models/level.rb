class Level < ApplicationRecord
  has_many :monsters

  def monsters_by_name
    monsters.by_name
  end
end
