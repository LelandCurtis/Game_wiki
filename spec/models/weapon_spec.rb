require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it {should belong_to :role}

  describe 'instance methods' do
    before :each do
      @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
      @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)

      @weapon_1 = Weapon.create!(name: 'weapon_1', ranged_attack: true, fire_rate: 0.5, damage: 30, role_id: @role_1.id)
      @weapon_2 = Weapon.create!(name: 'weapon_2', ranged_attack: false, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
    end
    it '#true tests if ranged_attack is true. If true, return true, else false.' do
      expect(@weapon_1.ranged_attack?).to eq(false)
      expect(@weapon_2.ranged_attack?).to eq(true)
    end
  end
end
