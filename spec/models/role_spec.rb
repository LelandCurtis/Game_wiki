require 'rails_helper'

RSpec.describe Role, type: :model do

  describe 'class methods' do
    before :each do
      @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
      @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)
      @role_3 = Role.create!(name: 'role_3', unlocked: false, health: 30)

      @weapon_1 = Weapon.create!(name: 'weapon_1', ranged_attack: true, fire_rate: 0.5, damage: 30, role_id: @role_1.id)
      @weapon_2 = Weapon.create!(name: 'weapon_2', ranged_attack: false, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
      @weapon_3 = Weapon.create!(name: 'weapon_3', ranged_attack: true, fire_rate: 1.0, damage: 45, role_id: @role_2.id)
      @weapon_4 = Weapon.create!(name: 'weapon_4', ranged_attack: true, fire_rate: 1.5, damage: 70, role_id: @role_2.id)
      @weapon_5 = Weapon.create!(name: 'weapon_5', ranged_attack: false, fire_rate: 1.0, damage: 80, role_id: @role_3.id)
      @weapon_6 = Weapon.create!(name: 'weapon_6', ranged_attack: true, fire_rate: 0.5, damage: 20, role_id: @role_3.id)
    end

    describe ' ##get_weapons' do
      it 'returns all weapons associated with given role_id.' do
        expect(Role.get_weapons(@role_1.id)).to eq([@weapon_1, @weapon_2])
      end
    end
  end

  it {should have_many :weapons}

  describe 'instance methods' do
    
  end
  # pending "add some examples to (or delete) #{__FILE__}"

end
