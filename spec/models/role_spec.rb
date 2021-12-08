require 'rails_helper'

RSpec.describe Role, type: :model do
  it {should have_many :weapons}

  describe 'instance methods' do
    before :each do
      @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
      @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)

      @weapon_1 = Weapon.create!(name: 'Bazooka', ranged_attack: true, fire_rate: 0.5, damage: 30, role_id: @role_1.id)
      @weapon_2 = Weapon.create!(name: 'AK-47', ranged_attack: false, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
      @weapon_3 = Weapon.create!(name: 'Sword', ranged_attack: true, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
      @weapon_4 = Weapon.create!(name: 'Popsicle', ranged_attack: true, fire_rate: 0.25, damage: 15, role_id: @role_2.id)
    end

    it "#by_name sorts the role's weapons by alphabetical order" do
      expected = [@weapon_2, @weapon_1, @weapon_3]
      expect(@role_1.weapons_by_name).to eq(expected)
    end

    it 'filters out all weapons below a damage threshold' do
      expect(@role_1.remove_damage_below(29)).to eq([@weapon_1])
      expect(@role_1.remove_damage_below(30)).to eq([])
      expect(@role_1.remove_damage_below(5)).to eq([@weapon_1, @weapon_2, @weapon_3])
    end
  end


end
