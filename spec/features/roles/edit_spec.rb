require rails_helper

RSpec describe 'roles#edit' do

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
  before :each do
    @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
    @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)
    @role_3 = Role.create!(name: 'role_3', unlocked: false, health: 30)

    @weapon_1 = Weapon.create!(name: 'weapon_1', ranged_attack: true, fire_rate: 0.5, damage: 30, role_id: @role_1.id)
    @weapon_2 = Weapon.create!(name: 'weapon_2', ranged_attack: false, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
  end

  it 'has a link from the role show page' do
    visit "roles/#{@role_1.id}"
    click_link "Update Role"
    expect(current_path).to eq("roles/#{@role_1.id}/edit")
  end

  it 'has a form that allows editing of all attributes and redirects to updated show page when form is submitted' do
    visit "roles/#{@role_1.id}/edit"

    fill_in "name" with: "Updated Name"
    select "False", from: "unlocked"
    fill_in "health", with: 25
    click_button "Update"

    expect(current_path).to eq("roles/#{@role_1.id}")
    expect(page).to have_content("Updated Name")
    expect(page).to have_content(false)
    expect(page).to have_content(25)
  end
end
