require 'rails_helper'

RSpec. describe 'levels creation' do
  it "links to the new page from the artist index" do
    visit '/levels'
    click_link("New Level")
    expect(current_path).to eq('/levels/new')
  end

  it "can create a new Level" do
    visit '/levels/new'

    fill_in("Name", with: "Level 4")
    click_button('Create Level')
    new_level_id = Level.last.id
    expect(current_path).to eq("/levels/#{new_level_id}")
    expect(page).to have_content("Level 4")
  end
end
