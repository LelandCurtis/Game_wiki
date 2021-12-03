class Role < ApplicationRecord
  has_many :weapons

  def self.get_weapons(role_id)
    Role.find(role_id).weapons
  end
end
