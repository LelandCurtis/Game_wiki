require 'rails_helper'

RSpec.describe 'all pages related to the weapons data' do
  RSpec.describe 'weapons index page' do
    before :each do
      @weapon_1 = Weapon.create(name: 'weapon_1', ranged_attack: true, fire_rate: .5, damage: 30, roles_id: 1)
      @weapon_2 = Weapon.create(name: 'weapon_2', ranged_attack: false, fire_rate: .25, damage: 15, roles_id: 1)
      @weapon_3 = Weapon.create(name: 'weapon_3', ranged_attack: true, fire_rate: 1.0, damage: 45, roles_id: 2)
      @weapon_4 = Weapon.create(name: 'weapon_4', ranged_attack: true, fire_rate: 1.5, damage: 70, roles_id: 2)
      @weapon_5 = Weapon.create(name: 'weapon_5', ranged_attack: false, fire_rate: 1.0, damage: 80, roles_id: 3)
      @weapon_6 = Weapon.create(name: 'weapon_6', ranged_attack: true, fire_rate: 0.5, damage: 20, roles_id: 3)
    end

    it 'exists' do
      visit '/weapons'
    end

    it 'has a title called "Weapons"' do
      visit '/weapons'
      expect(page).to have_content("Weapons")
    end

    it 'lists weapon names' do
      vist '/weapons'
      expect(page).to have_content(@weapon_1.name)
      expect(page).to have_content(@weapon_2.name)
      expect(page).to have_content(@weapon_3.name)
      expect(page).to have_content(@weapon_4.name)
      expect(page).to have_content(@weapon_5.name)
      expect(page).to have_content(@weapon_6.name)
    end
  end
end
