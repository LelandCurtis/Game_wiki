require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it {should belong_to :role}

  describe 'class methods' do
    before :each do
      @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
      @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)

      @weapon_1 = Weapon.create!(name: 'Bazooka', ranged_attack: true, fire_rate: 0.5, damage: 30, role_id: @role_1.id)
      @weapon_2 = Weapon.create!(name: 'AK-47', ranged_attack: false, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
      @weapon_3 = Weapon.create!(name: 'Sword', ranged_attack: true, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
    end

    it '.ranged_attack_weapons returns' do
      expected = [@weapon_1, @weapon_3]
      expect(Weapon.ranged_attack_weapons).to eq(expected)
    end

    it '.by_name sorts weapons by alphabetical order' do
      expected = [@weapon_2, @weapon_1, @weapon3]
      expect(Weapon.by_name).to eq(expected)
    end
  end
end
