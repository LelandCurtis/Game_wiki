require 'rails_helper'

RSpec.describe 'roles show page' do
  before :each do
    @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
    @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)
    @role_3 = Role.create!(name: 'role_3', unlocked: false, health: 30)
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
    expect(page).to have_content("Unlcoked? #{@role_1.unlocked}")
    expect(page).to have_content("Health: #{@role_1.health}")
  end

  it "doesn't show data related to other roles" do
    visit "/roles/#{@role_1.id}"
    expect(page).to_not have_content(@role_2.name)
    expect(page).to_not have_content("Unlcoked: #{@role_2.unlocked}")
    expect(page).to_not have_content("Health: #{@role_2.health}")
  end
end
