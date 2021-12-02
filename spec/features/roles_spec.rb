require 'rails_helper'

RSpec.describe 'all pages related to roles' do
  RSpec.describe 'roles index page' do
    before :each do
      @role_1 = Role.create(name: 'role_1', unlocked: true, health: 20)
      @role_2 = Role.create(name: 'role_2', unlocked: true, health: 25)
      @role_3 = Role.create(name: 'role_3', unlocked: false, health: 30)
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

    xit 'shows every record' do
      visit '/roles'
    end
  end
end
