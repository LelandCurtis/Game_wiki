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
  end

  it 'exists' do
    visit '/weapons'
  end

  it 'has a title called "Weapons"' do
    visit '/weapons'
    expect(page).to have_content("Weapons")
  end

  it 'lists weapon names if ranged_weapon == true' do
    visit '/weapons'
    expect(page).to have_content(@weapon_1.name)
    expect(page).to have_content(@weapon_3.name)
    expect(page).to have_content(@weapon_4.name)
    expect(page).to have_content(@weapon_6.name)

    expect(page).to_not have_content(@weapon_2.name)
    expect(page).to_not have_content(@weapon_5.name)
  end

  it 'has an edit link next to each item ' do
    visit '/weapons'
    save_and_open_page
    expect(page).to have_button("Edit_#{@weapon_1.id}")
    expect(page).to have_button("Edit_#{@weapon_3.id}")
    expect(page).to have_button("Edit_#{@weapon_4.id}")
    expect(page).to have_button("Edit_#{@weapon_6.id}")

    expect(page).to_not have_button("Edit_#{@weapon_2.id}")
    expect(page).to_not have_button("Edit_#{@weapon_5.id}")

    page.find_by_id("Edit_#{@weapon_3.id}").click
    expect(current_path).to eq("/weapons/#{@weapon_3.id}/edit")
  end
end
