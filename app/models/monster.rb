class Monster < ApplicationRecord
  belongs_to :level

  def self.enraged_monsters
    Monster.where('enraged = true')
  end
end
