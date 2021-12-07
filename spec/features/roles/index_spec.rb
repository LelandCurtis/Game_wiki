require 'rails_helper'

RSpec.describe 'roles index page' do
  before :each do
    @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
    @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)
    @role_3 = Role.create!(name: 'role_3', unlocked: false, health: 30)
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
    expect(page).to have_content(@role_1.name)
    expect(page).to have_content(@role_2.name)
    expect(page).to have_content(@role_3.name)
  end

  it 'displays each in the order it was created.' do
    visit '/roles'
    Role.destroy(@role_2.id)
    @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)
    visit current_path
    item_1 = @role_1.name
    item_2 = @role_2.name
    item_3 = @role_3.name
    expected = [item_1, item_3, item_2]
    expect(page.find(:css, '.roles').all(:css, 'h3').map(&:text).split('\n')[0]).to eq(expected)
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
end
