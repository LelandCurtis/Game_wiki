require 'rails_helper'

RSpec.describe 'weapons index page' do
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

    @weapons = [@weapon_1, @weapon_2, @weapon_3, @weapon_4, @weapon_5, @weapon_6]
  end

  it 'exists' do
    visit '/weapons'
  end

  it 'has a title called "Weapons"' do
    visit '/weapons'
    expect(page).to have_content("Weapons")
  end

  it 'lists weapon names if ranged_weapon == true' do
    @weapons.each do |weapon|
      visit '/weapons'
      if weapon.ranged_attack
        expect(page).to have_content(weapon.name)
      else
        expect(page).to_not have_content(weapon.name)
      end
    end
  end

  it 'has an edit link next to each item ' do
    @weapons.each do |weapon|
      visit '/weapons'
      if weapon.ranged_attack
        within('div.weapon', id="#{weapon.id}") do
          expect(page).to have_button("Edit")
          page.find_by_id("Edit_#{weapon.id}").click
          expect(current_path).to eq("/weapons/#{weapon.id}/edit")
        end
      end
    end
  end

  it 'has links to corresponding show pages for each weapon' do
    @weapons.each do |weapon|
      visit '/weapons'
      if weapon.ranged_attack
        expect(page).to have_link("#{weapon.name}")
        click_link "#{weapon.name}"
        expect(current_path).to eq("/weapons/#{weapon.id}")
      end
    end
  end

  it "has a delete button next to each weapon" do
    @weapons.each do |weapon|
      visit '/weapons'
      if weapon.ranged_attack
        within('div.weapon', id="#{weapon.id}") do
          expect(page).to have_button("Delete")
          click_button "Delete"
          expect(current_path).to eq("/weapons")
          expect(current_path).to_not have_content("#{weapon.name}")
        end
      end
    end
  end
end
