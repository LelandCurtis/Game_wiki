require 'rails_helper'

RSpec.describe 'levels creation' do
  it "links to the new page from the levels index" do
    visit '/levels'
    click_link("New Level")
    expect(current_path).to eq('/levels/new')
  end

  it "can create a new Level" do
    visit '/levels/new'

    fill_in('Name', with: "Level_4")
    fill_in('Difficulty', with: 20)
    select("True", from: 'Boss')
    click_button('Create Level')

    expect(current_path).to eq("/levels")
    expect(page).to have_content("Level_4")
  end
end
