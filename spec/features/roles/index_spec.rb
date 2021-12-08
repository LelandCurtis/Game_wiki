require 'rails_helper'

RSpec.describe 'roles index page' do
  before :each do
    @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
    @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)
    @role_3 = Role.create!(name: 'role_3', unlocked: false, health: 30)

    @weapon_1 = Weapon.create!(name: 'Bazooka', ranged_attack: true, fire_rate: 0.5, damage: 30, role_id: @role_1.id)
    @weapon_2 = Weapon.create!(name: 'AK-47', ranged_attack: false, fire_rate: 0.25, damage: 15, role_id: @role_2.id)
    @weapon_3 = Weapon.create!(name: 'weapon_3', ranged_attack: true, fire_rate: 1.0, damage: 45, role_id: @role_2.id)
    @weapon_4 = Weapon.create!(name: 'weapon_4', ranged_attack: true, fire_rate: 1.5, damage: 70, role_id: @role_2.id)
    @weapon_5 = Weapon.create!(name: 'weapon_5', ranged_attack: false, fire_rate: 1.0, damage: 80, role_id: @role_3.id)
    @weapon_6 = Weapon.create!(name: 'weapon_6', ranged_attack: true, fire_rate: 0.5, damage: 20, role_id: @role_3.id)

    @weapons = [@weapon_1, @weapon_2, @weapon_3, @weapon_4, @weapon_5, @weapon_6]
    @roles = [@role_1, @role_2, @role_3]
  end

  it 'exists' do
    visit '/roles'
  end

  it 'has a title called "Roles"' do
    visit '/roles'
    expect(page).to have_content("Roles")
  end

  it 'displays each role name' do
    visit '/roles'
    @roles.each do |role|
      expect(page).to have_content(role.name)
    end
  end

  it 'displays each in the order it was created' do
    visit '/roles'
    expect(@role_1.name).to appear_before(@role_2.name)
    expected = [@item_1, @item_3, @item_4]
  end

  it 'displays when it was created' do
    visit '/roles'
    expect(page).to have_content(@role_1.created_at)
    expect(page).to have_content(@role_2.created_at)
    expect(page).to have_content(@role_3.created_at)
  end

  it 'has an edit links next to each item' do
    visit '/roles'
    expect(page).to have_button("Edit_#{@role_1.id}")
    expect(page).to have_button("Edit_#{@role_2.id}")
    expect(page).to have_button("Edit_#{@role_3.id}")

    page.find_by_id("Edit_#{@role_2.id}").click
    expect(current_path).to eq("/roles/#{@role_2.id}/edit")
  end

  it 'has links to each show page through the title of the role' do
    @roles.each do |role|
      visit '/roles'
      expect(page).to have_link("#{role.name}")
      click_link "#{role.name}"
      expect(current_path).to eq("/roles/#{role.id}")
    end
  end

  it 'has a delete link for each role' do
    @roles.each do |role|
      visit '/roles'
      name = role.name
      expect(page).to have_link("#{role.name}")
      within('div.role', :id => "role_#{role.id}") do |ref|
        click_button "Delete Role"
        expect(current_path).to eq("/roles")
        expect(current_path).to_not have_content("#{role.name}")
      end
    end
  end

  it 'has a link to sort index by the # of children' do
    visit '/roles'
    expect(page).to have_link("Sort By Weapon Count")
    expect(@role_1.name).to appear_before(@role_2.name)
    click_link "Sort By Weapon Count"
    expect(@role_2.name).to appear_before(@role_1.name)
  end
end
