require 'rails_helper'

RSpec.describe 'ApplicationRecord' do
  describe '::by_name sorts all objects by name' do
    before :each do
      @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
      @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)

      @weapon_1 = Weapon.create!(name: 'Bazooka', ranged_attack: true, fire_rate: 0.5, damage: 30, role_id: @role_1.id)
      @weapon_2 = Weapon.create!(name: 'AK-47', ranged_attack: false, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
      @weapon_3 = Weapon.create!(name: 'Sword', ranged_attack: true, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
      @weapon_4 = Weapon.create!(name: 'Popsicle', ranged_attack: true, fire_rate: 0.25, damage: 15, role_id: @role_2.id)
    end
    it "sorts by name" do
      expect(Weapon.by_name).to eq([@weapon_2, @weapon_1, @weapon_4, @weapon_3])
    end
  end
end
