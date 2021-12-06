require 'rails_helper'

RSpec.describe 'edit weapon' do
  before :each do
    @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
    @role_2 = Role.create!(name: 'role_2', unlocked: false, health: 30)

    @weapon_1 = Weapon.create!(name: 'weapon_1', ranged_attack: true, fire_rate: 0.5, damage: 30, role_id: @role_1.id)
    @weapon_2 = Weapon.create!(name: 'weapon_2', ranged_attack: false, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
    @weapon_3 = Weapon.create!(name: 'weapon_3', ranged_attack: true, fire_rate: 1.0, damage: 45, role_id: @role_2.id)
  end

  it 'links from the weapons show page' do
    visit "/weapons/#{@weapon_1.id}"
    click_link "Update Weapon"
    expect(current_path).to eq("/weapons/#{@weapon_1.id}/edit")
  end

  it 'has a form that updates all attributes of selected weapon' do
    visit "/weapons/#{@weapon_1.id}/edit"

    fill_in "name", with: "New name"
    select "False", from: 'ranged_attack'
    fill_in "fire_rate", with: 1
    fill_in "damage", with: 45
    click_button "Update"

    expect(page).to have_content("New name")
    expect(page).to have_content(false)
    expect(page).to have_content(1)
    expect(page).to have_content(45)
    expect(page).to_not have_content('weapon_1')
    expect(page).to_not have_content(true)
    expect(page).to_not have_content(0.5)
    expect(page).to_not have_content(30)
    expect(page).to_not have_content('weapon_2')
    expect(page).to_not have_content('weapon_3')


  end
end
