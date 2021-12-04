require 'rails_helper'

RSpec.describe 'roles show page' do
  before :each do
    @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
    @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)
    @role_3 = Role.create!(name: 'role_3', unlocked: false, health: 30)

    @weapon_1 = Weapon.create!(name: 'weapon_1', ranged_attack: true, fire_rate: 0.5, damage: 30, role_id: @role_1.id)
    @weapon_2 = Weapon.create!(name: 'weapon_2', ranged_attack: false, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
  end

  it 'routes properly' do
    visit "/roles/#{@role_1.id}"
  end

  it 'has a title of the name of the Role' do
    visit "/roles/#{@role_1.id}"
    expect(page).to have_content(@role_1.name)
  end

  it 'displays all data related to that role' do
    visit "/roles/#{@role_1.id}"
    expect(page).to have_content("Unlocked? #{@role_1.unlocked}")
    expect(page).to have_content("Health: #{@role_1.health}")
  end

  it "doesn't show data related to other roles" do
    visit "/roles/#{@role_1.id}"
    expect(page).to_not have_content(@role_2.name)
  end

  it 'shows the count of weapons associated with this role' do
    visit "/roles/#{@role_1.id}"
    expect(page).to have_content(@role_1.weapons.count)
  end

  it 'has a link to the role_weapons index page associated with the role' do
    visit "/roles/#{@role_1.id}"
    expect(page).to have_link("Available Weapons")
    click_link "Available Weapons"
    expect(current_path).to eq("/roles/#{@role_1.id}/weapons")
  end
end
