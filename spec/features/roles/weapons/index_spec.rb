require 'rails_helper'

RSpec.describe 'page indexing all weapons belonging to a particular role' do
  before :each do
    @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
    @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)
    @role_3 = Role.create!(name: 'role_3', unlocked: false, health: 30)

    @weapon_1 = Weapon.create!(name: 'Bazooka', ranged_attack: true, fire_rate: 0.5, damage: 30, role_id: @role_1.id)
    @weapon_2 = Weapon.create!(name: 'AK-47', ranged_attack: false, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
    @weapon_3 = Weapon.create!(name: 'weapon_3', ranged_attack: true, fire_rate: 1.0, damage: 45, role_id: @role_2.id)
    @weapon_4 = Weapon.create!(name: 'weapon_4', ranged_attack: true, fire_rate: 1.5, damage: 70, role_id: @role_2.id)
    @weapon_5 = Weapon.create!(name: 'weapon_5', ranged_attack: false, fire_rate: 1.0, damage: 80, role_id: @role_3.id)
    @weapon_6 = Weapon.create!(name: 'weapon_6', ranged_attack: true, fire_rate: 0.5, damage: 20, role_id: @role_3.id)

    @weapons = [@weapon_1, @weapon_2, @weapon_3, @weapon_4, @weapon_5, @weapon_6]
    @roles = [@role_1, @role_2, @role_3]
  end

  it 'routes properly' do
    visit "/roles/#{@role_1.id}/weapons"
  end

  it 'has a title call "Weapons available to ..Role name"' do
    visit "/roles/#{@role_1.id}/weapons"
    expect(page).to have_content("Weapons Available To #{@role_1.name} :")
  end

  it 'lists all weapons and their attributes' do
    @roles.each do |role|
      visit "/roles/#{role.id}/weapons"
      role.weapons.each do |weapon|
        expect(page).to have_content(weapon.name)
        expect(page).to have_content("Ranged Attack? #{weapon.ranged_attack}")
        expect(page).to have_content("Fire Rate: #{weapon.fire_rate}")
        expect(page).to have_content("Damage: #{weapon.damage}")
      end
    end
  end

  it "doesn't show data related to other weapons" do
    visit "/roles/#{@role_1.id}/weapons"
    expect(page).to_not have_content(@weapon_3.name)
  end

  it 'has link to sort index page' do
    @roles.each do |role|
      visit "/roles/#{role.id}/weapons"
      name_1 = role.weapons.first.name
      name_2 = role.weapons.last.name
      orig_order = [name_1, name_2]
      sort_order = orig_order.sort
      expect(orig_order[0]).to appear_before(orig_order[1], only_text: true)
      click_link "Sort Index"
      expect(sort_order[0]).to appear_before(sort_order[1], only_text: true)
    end
  end

  it 'has an edit link next to each item ' do
    @roles.each do |role|
      role.weapons.each do |weapon|
        visit "/roles/#{role.id}/weapons"
        within('div.weapon', :id => "weapon_#{weapon.id}") do
          expect(page).to have_button("Edit")
          click_button "Edit"
          expect(current_path).to eq("/weapons/#{weapon.id}/edit")
        end
      end
    end
  end

  it 'has a delete button next to each item' do
    @roles.each do |role|
      role.weapons.each do |weapon|
        visit "/roles/#{role.id}/weapons"
        within('div.weapon', :id => "weapon_#{weapon.id}") do
          expect(page).to have_button("Delete")
          click_button "Delete"
          expect(current_path).to eq("/weapons")
        end
      end
    end
  end

  it 'has a form that allows filtering by damage' do
    threshold = 35
    @roles.each do |role|
      visit "/roles/#{role.id}/weapons"
      fill_in "damage", with: threshold
      click_button "Only return weapons with damage higher than input value"

      expect(current_path).to eq("/roles/#{role.id}/weapons")

      role.weapons.each do |weapon|
        if weapon.damage > threshold
          expect(page).to have_content(weapon.name)
        else
          expect(page).to_not have_content(weapon.name)
        end
      end
    end
  end
end
