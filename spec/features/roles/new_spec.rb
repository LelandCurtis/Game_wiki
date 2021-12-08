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

  it 'has a form to create a role and redirects to roles index after submit' do
    visit '/roles/new'
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
