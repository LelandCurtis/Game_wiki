require 'rails_helper'

RSpec.describe 'roles#new' do
  it 'exists' do
    visit '/roles/new'
  end

  it 'has a link from the roles index page' do
    visit '/roles'
    expect(page).to have_link("Create New Role")
    click_link "Create New Role"
    expect(current_path).to eq('/roles/new')
  end

  it 'has text input field for name' do
    visit '/roles/new'
    expect(page).to have_field('name')
    fill_in "name", with: 'New Role'
    expect(page).to have_field('name', with: 'New Role')
  end

  it 'has select input field for unlocked' do
    visit '/roles/new'
    expect(page).to have_field('unlocked')
    select "True", from: 'unlocked'
    expect(page).to have_field('unlocked', with: 'true')
  end

  it 'has a health input as number' do
    visit '/roles/new'
    expect(page).to have_field('health')
    fill_in "health", with: 100
    expect(page).to have_field('health', with: 100)
  end

  it 'has a submit button that redirects to roles index after new role is added' do
    visit '/roles/new'
    save_and_open_page
    expect(page).to have_button('Create Role')

    fill_in "name", with: 'New Role'
    select "True", from: 'unlocked'
    fill_in "health", with: 100

    click_button('Create Role')
    role_id = Role.last.id
    expect(current_path).to eq("/roles")
    expect(page).to have_content("New Role")
  end
end
